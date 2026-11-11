# SOLIX Tracker System

Flutter Web dashboard for live GPS fleet tracking. One screen shows the tracker list, the selected tracker, and a map with street and satellite layers. Live positions come from the Yemen Track API and refresh on a timer.

## Run

From the project root:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome ^
  --dart-define=API_BASE_URL=https://yapi.yementrack.com ^
  --dart-define=API_HASH=your_hash_here ^
  --dart-define=REFRESH_INTERVAL_SECONDS=10 ^
  --dart-define=STATE_BATCH_SIZE=100
```

On macOS or Linux, replace `^` with `\`.

A Chrome launch configuration with an empty hash is in `.vscode/launch.json`. Put the real hash only in the local launch args or your shell. Do not commit it.

Release build:

```bash
flutter build web --dart-define=API_BASE_URL=https://yapi.yementrack.com --dart-define=API_HASH=your_hash_here
```

`--dart-define` values are compiled into the web build. Prefer a backend proxy that adds the hash server-side before this app is exposed on the public internet. The app never prints the hash. Request logs include only the path and status code.

## Map tiles

The map uses [flutter_map](https://pub.dev/packages/flutter_map). A Street / Satellite control in the top-right corner swaps the tile layer only. Markers, the selected tracker, trip polylines, and the camera stay on the same map. No Google Maps API key is required.

Street tiles default to `https://tile.openstreetmap.org/{z}/{x}/{y}.png`. The public OpenStreetMap tile server is for light use only. For a production deployment, set `MAP_TILE_URL` to a provider that allows your traffic and set `MAP_TILE_ATTRIBUTION` to that provider's credit. Policy: https://operations.osmfoundation.org/policies/tiles/

Satellite tiles default to the documented Esri World Imagery MapServer resource:

`https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}`

`{y}` is the tile row and `{x}` is the column, which is the order published by that service. The map shows `Powered by Esri` and the service's current data credit: `Source: Esri, Vantor, Earthstar Geographics, and the GIS User Community`. Use is subject to Esri's terms: https://goto.arcgisonline.com/maps/World_Imagery

Point `SATELLITE_TILE_URL` at another licensed template if this deployment cannot use that service, and set `SATELLITE_TILE_ATTRIBUTION` to the matching credit. Do not substitute an undocumented tile URL.

```bash
--dart-define=MAP_TILE_URL=https://tile.openstreetmap.org/{z}/{x}/{y}.png
--dart-define=MAP_TILE_ATTRIBUTION=© مساهمو OpenStreetMap
--dart-define=MAP_TILE_MAX_ZOOM=19
--dart-define=SATELLITE_TILE_URL=https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}
--dart-define=SATELLITE_TILE_ATTRIBUTION=Source: Esri, Vantor, Earthstar Geographics, and the GIS User Community
--dart-define=SATELLITE_TILE_MAX_ZOOM=19
```

`{z}`, `{x}`, and `{y}` are required placeholders. The app identifies itself to the tile server as `map_yemen_tracker`. World Imagery also publishes levels 20–23 in some places; raise `SATELLITE_TILE_MAX_ZOOM` only when those tiles are needed.

## Configuration

| Define | Default | Purpose |
| --- | --- | --- |
| `API_BASE_URL` | `https://yapi.yementrack.com` | API origin |
| `API_HASH` | built-in hash in `AppConfig` | Credential sent in each JSON body. A `--dart-define` replaces the built-in value, including an empty one. |
| `REFRESH_INTERVAL_SECONDS` | `10` | Live GPS poll interval. The toolbar can change it at runtime (5–60 seconds). |
| `STATE_BATCH_SIZE` | `100` | Tracker IDs per `/tracker/get_states` request. |
| `TRIP_POINT_LIMIT` | `1000` | `point_limit` sent to `/track/list`. |
| `MAP_TILE_URL` | OpenStreetMap tile template | Street tiles. Must include `{z}`, `{x}`, and `{y}`. |
| `MAP_TILE_ATTRIBUTION` | `© مساهمو OpenStreetMap` | Credit shown on the street layer. |
| `MAP_TILE_MAX_ZOOM` | `19` | Highest street zoom requested from the tile server. |
| `SATELLITE_TILE_URL` | Esri World Imagery tile template | Satellite tiles. `{y}` is the row and comes before `{x}` on the default service. |
| `SATELLITE_TILE_ATTRIBUTION` | Esri World Imagery `copyrightText` | Credit shown on the satellite layer. |
| `SATELLITE_TILE_MAX_ZOOM` | `19` | Highest satellite zoom requested from the tile server. |

## Tests

```bash
flutter test
flutter analyze
```

## Project layout

- `lib/core` — configuration, Dio client, theme, GetIt, formatting
- `lib/features/tracker` — tracker models, repository, list, details, and live GPS cubits
- `lib/features/trip` — trip models, repository, history, and playback
- `lib/features/map` — map presentation and marker generation
- `lib/features/dashboard` — the single responsive screen

State is split across five cubits: `TrackersCubit`, `TrackerDetailsCubit`, `LiveTrackingCubit`, `TripHistoryCubit`, and `MapCubit`. GetIt only constructs dependencies. GPS coordinates live in `LiveTrackingCubit`.

## Assumptions

- `connection_status` value `active` means online. Any other value, including a missing status, is offline once a state object exists.
- `movement_status` is compared with `moving` and `parked` only. Other values stay visible under All but not under those two filters.
- Speed is labeled km/h, altitude meters, and trip `length` kilometers. The API samples do not name the units.
- Timestamps are shown exactly as the API sends them. They have no timezone.
- The trip request sends `point_limit` 1000 so a route can be drawn. The sample request used 10.
- `/tracker/get_states` is called with `list_blocked: true` and `allow_not_exist: true`. IDs are sent in batches of 100.
- There is no group-name or tag-name endpoint, so the UI shows group IDs and `Tag {id}`.
- Live mileage is shown only when `additional` contains `mileage`, `odometer`, `can_mileage`, or `total_mileage`. Otherwise the mileage section says "Not available".
- The default trip range is the last 24 hours. The end must be after the start.
- Polling pauses when the browser tab is hidden. It keeps running during short focus changes such as a date dialog.
- (0, 0) is treated as a valid coordinate. Null, NaN, and out-of-range values are not drawn.
