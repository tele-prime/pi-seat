import 'package:get/get.dart';

class ApiClient extends GetConnect {
    ApiClient({
        Duration timeout = const Duration(seconds: 30),
    }) {
        httpClient.baseUrl = baseUrl;
        httpClient.timeout = timeout;

        // attach default headers (authorization handled automatically if token set)
        httpClient.addRequestModifier<dynamic>((request) {
            request.headers['Content-Type'] = 'application/json';
            return request;
        });
    }


    Future<Response<dynamic>> getFullUrl(
        String url, {
        Map<String, dynamic>? query,
        Map<String, String>? headers,
    }) async {
        try {
            return await httpClient.get(url, query: query, headers: _mergeHeaders(headers));
        } catch (e) {
            return Response(statusCode: 500, statusText: e.toString());
        }
    }

    Map<String, String> _mergeHeaders(Map<String, String>? headers) {
        final base = <String, String>{'Content-Type': 'application/json'};
        if (headers != null) {
            base.addAll(headers);
        }
        return base;
    }
}
