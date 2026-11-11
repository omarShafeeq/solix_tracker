import 'dart:js_interop';

@JS('window.open')
external void _windowOpen(JSString url, JSString target, JSString features);

void openExternalUrlImpl(String url) {
  _windowOpen(url.toJS, '_blank'.toJS, 'noopener,noreferrer'.toJS);
}
