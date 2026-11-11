import 'open_url_stub.dart'
    if (dart.library.html) 'open_url_web.dart'
    as opener;

void openExternalUrl(String url) => opener.openExternalUrlImpl(url);
