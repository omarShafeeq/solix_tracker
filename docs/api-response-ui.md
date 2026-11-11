# API responses and how the UI uses them

Base URL: `https://yapi.yementrack.com`

Every request is `POST` with a JSON body. The body always includes `hash`. Text that comes from the API is shown as sent. The app does not translate names, addresses, or status words.

A missing or empty text value is shown as **غير متوفر**. A missing number is shown the same way, except where a section below says the value is hidden instead.

Numbers may arrive as JSON numbers or numeric strings. Both are accepted. Timestamps are shown exactly as the API sends them. The app does not apply a timezone.

Assumed units, because the API does not name them:

| Value | Shown as |
| --- | --- |
| Speed | km/h (`كم/س`) |
| Altitude | meters (`م`) |
| Trip `length` | kilometers (`كم`) |

A coordinate is usable only when both `lat` and `lng` are present, finite, `lat` is between -90 and 90, and `lng` is between -180 and 180. `(0, 0)` is a valid point. Invalid coordinates are not drawn on the map.

## POST `/tracker/list`

Loads the tracker list once. It is not called on the live refresh timer.

Request body: `{ "hash": "..." }`

Response:

```json
{ "list": [ { "id": 1, "label": "...", "group_id": 1, "source": {}, "tag_bindings": [], "clone": false } ] }
```

Items with no `id` are dropped and never shown.

| Response field | UI |
| --- | --- |
| `list` | The tracker sidebar. An empty list shows the empty-filter message when a search or filter matches nothing. |
| `id` | Shown as `#id` on the list row, and as **معرف المتتبع** in details. Search matches this number. Map markers and trip requests use it. |
| `label` | Tracker name in the list, the map hover label, the map selection card, and **اسم المتتبع**. An empty label is shown as `متتبع {id}`. |
| `group_id` | **معرف المجموعة** in General information. |
| `source.id` | **معرف المصدر** when the live state has no `source_id`. |
| `source.creation_date` | **تاريخ الإنشاء**. |
| `source.blocked` | Grey status dot and **محظور** when no movement text exists. The **محظور** filter uses this flag. Details show **محظور** as نعم or لا. A blocked tracker gets the grey map arrow, ahead of online or parked colors. |
| `source.device_id` | **معرف الجهاز**. |
| `source.tariff_id` | **معرف التعرفة**. |
| `source.model` | Second line of the list row, and **الطراز**. |
| `source.tariff_end_date` | **انتهاء الاشتراك**. |
| `source.phone` | **الهاتف**. |
| `source.status_listing_id` | Parsed and not shown. |
| `tag_bindings` | A missing or non-list value becomes an empty list. Each `tag_id` is a **وسم {id}** chip on the row and in **الوسوم**. |
| `tag_bindings[].ordinal` | Parsed and not shown. |
| `clone` | Parsed. Missing means false. Not shown. |

Selecting a row calls `/tracker/read`, focuses the map on that tracker, and opens the details panel.

## POST `/tracker/read`

Loads the selected tracker. It is not called on the live refresh timer.

Request body: `{ "hash": "...", "tracker_id": 1 }`

Response:

```json
{ "success": true, "value": { "id": 1, "label": "...", "group_id": 1, "source": {}, "tag_bindings": [], "clone": false } }
```

`value` uses the same fields as one item in `/tracker/list`. The details panel replaces the list copy with this object.

| Response field | UI |
| --- | --- |
| `success` | Must be `true`. Otherwise the details panel shows **تفاصيل المتتبع غير متاحة.** |
| `value` | Must be present and must have `id`. Otherwise the same error is shown. |
| `value.*` | Same General information, device, and tag rows as the list fields above. |

Live location and status in that panel still come from `/tracker/get_states`, not from this response.

## POST `/tracker/get_states`

Polled on a timer. The default interval is 10 seconds. The list and details endpoints are not called on this timer. IDs are sent in batches. The default batch size is 100.

Request body:

```json
{
  "hash": "...",
  "trackers": [1, 2],
  "list_blocked": true,
  "allow_not_exist": true
}
```

Response:

```json
{
  "success": true,
  "user_time": "2026-10-28 15:50:07",
  "states": {
    "1": { "gps": { "location": { "lat": 15.3, "lng": 44.2 } } },
    "2": null
  }
}
```

`success` must be `true`. Otherwise the previous GPS data stays on screen and the error is shown. State keys that are not integers are ignored. A `null` state is kept, which means that tracker was requested and has no state object.

| Response field | UI |
| --- | --- |
| `user_time` | Stored with the live data. The map banner shows the app's last successful sync time, not this string. |
| `states.{trackerId}` | Live data for that tracker. `null` means there is no GPS row: no marker, and the list waits for a status. |
| `source_id` | **معرف المصدر**. Falls back to `source.id` from the tracker object. |
| `gps.location.lat` | **خط العرض**, and the marker latitude when the pair is valid. |
| `gps.location.lng` | **خط الطول**, and the marker longitude when the pair is valid. |
| `gps.alt` | **الارتفاع**. |
| `gps.updated` | **تحديث الموقع**, and the GPS line on the map selection card. |
| `gps.signal_level` | **إشارة الموقع**, shown as a percent. |
| `gps.heading` | **الاتجاه**, and the rotation of the map arrow. Missing heading draws the arrow pointing north. |
| `gps.speed` | **السرعة**, the speed on the list row, and the speed on the map selection card. |
| `connection_status` | Shown unchanged in the details **الاتصال** row, the status badge, and the map card. The color is green only when the lowercase value is `active`. Any other value, including a missing status after a state object exists, is treated as offline and colored red. The **متصل** filter keeps `active`. The **غير متصل** filter keeps a state that is not `active`. |
| `movement_status` | Shown unchanged in **الحركة** and under the tracker name. `moving` matches the **متحرك** filter. `parked` matches the **متوقف** filter and, for an online tracker that is not blocked, colors the arrow amber. Other words stay visible under **الكل** only. |
| `movement_status_update` | Parsed and not shown. |
| `ignition` | **تشغيل المحرك**: تشغيل or إيقاف. Missing shows **غير متوفر**. |
| `ignition_update` | Parsed and not shown. |
| `inputs` | **مدخل 1**, **مدخل 2**, and so on. `true` is تشغيل and `false` is إيقاف. A missing list shows **غير متوفر**. |
| `outputs` | **مخرج 1**, **مخرج 2**, and so on, with the same تشغيل / إيقاف rule. |
| `last_update` | **آخر تحديث**. |
| `gsm.network_name` | **الشبكة**. |
| `gsm.signal_level` | **إشارة الجوال**, shown as a percent. |
| `gsm.roaming` | **التجوال**: نعم or لا. |
| `gsm.updated` | Parsed and not shown. |
| `battery_level` | **البطارية**, shown as a percent. |
| `battery_update` | **تحديث البطارية**. |
| `additional` | Only `mileage`, `odometer`, `can_mileage`, and `total_mileage` are read. The first non-empty `value` is **المسافة المقطوعة**. Any other key is ignored. If none of those keys exist, the row shows **غير متوفر**. |
| `additional.*.updated` | Parsed and not shown. |
| `actual_track_update` | Parsed and not shown. |

Map marker color, in order: blocked grey, then offline red, then parked amber, then online green. A marker is drawn only when the tracker is checked in the list and the GPS coordinate is valid. Hovering the arrow shows `label`. Tapping it selects the tracker.

If a later poll fails, the last GPS fix, list, and details stay on screen. The map banner shows the error and that the data is stale.

## POST `/track/list`

Loads trips for the selected tracker and the chosen date range. It runs when the user presses **تحميل**, not on the live timer.

Request body:

```json
{
  "hash": "...",
  "tracker_id": 1,
  "from": "2026-10-28 00:00:00",
  "to": "2026-10-28 23:59:59",
  "with_points": true,
  "point_limit": 1000
}
```

`point_limit` defaults to 1000. `from` and `to` are sent as `yyyy-MM-dd HH:mm:ss`.

Response:

```json
{ "list": [ { "id": 1, "start_date": "...", "end_date": "...", "points_list": [] } ] }
```

| Response field | UI |
| --- | --- |
| `list` | The trip list. An empty list shows **لا توجد رحلات في هذه الفترة.** |
| `id` | Parsed. Selection uses the row index, so a trip with no `id` can still be opened. |
| `start_date` | Start of the trip row, and the duration together with `end_date`. |
| `end_date` | End of the trip row. |
| `avg_speed` | **متوسط** speed on the trip row. |
| `max_speed` | **أقصى** speed on the trip row. |
| `length` | Distance on the trip row, labeled as kilometers. |
| `start_address` | **من** on the trip row. |
| `end_address` | **إلى** on the trip row. |
| `points` | Point count on the trip row. If it is missing, the app counts `points_list`. |
| `bounds.nw`, `bounds.se` | Used to fit the map when a trip is selected, when both corners are valid. Otherwise the map fits the valid points in `points_list`. |
| `type` | Parsed and not shown. |
| `points_list` | The route. Valid points become the map polyline. The first valid point is the **ب** marker and the last is the **ن** marker. Playback walks this list and moves an arrow using each point's `lat`, `lng`, and `heading`. |
| `points_list[].lat`, `points_list[].lng` | Route position. Invalid pairs are skipped. |
| `points_list[].heading` | Playback arrow rotation. |
| `points_list[].address` | Parsed and not shown. |
| `points_list[].satellites` | Parsed and not shown. |
| `points_list[].mileage` | Parsed and not shown. |
| `points_list[].speed` | Parsed and not shown. |
| `points_list[].buffered` | Parsed and not shown. |
| `points_list[].alt` | Parsed and not shown. |
| `points_list[].get_time` | Parsed and not shown. |

The live tracker arrows stay on the map unless the user hides them. The trip route is drawn on top when a trip is selected.
