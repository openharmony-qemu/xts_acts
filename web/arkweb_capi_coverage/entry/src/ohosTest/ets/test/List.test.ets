import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

import scrollTest from './scroll.test';
import request_headerTest from './request_header.test';
import resource_requestTest from './resource_request.test';
import http_body_streamTest from './http_body_stream.test';
import scheme_handlerTest from './scheme_handler.test';
import responseTest from './response.test';
import resource_handlerTest from './resource_handler.test';
import releaseTest from './release.test';
import native_jsTest from './native_js.test';
import native_proxyTest from './native_proxy.test';
import native_destroyTest from './native_destroy.test';
import native_loadTest from './native_load.test';
import native_blanklessTest from './native_blankless.test';
import native_engineTest from './native_engine.test';
import native_cookieTest from './native_cookie.test';
import nativeModuleLoadTest from './native_module_load.test';

export default function testsuite() {
  nativeModuleLoadTest();
  scrollTest();
  request_headerTest();
  resource_requestTest();
  http_body_streamTest();
  scheme_handlerTest();
  responseTest();
  resource_handlerTest();
  releaseTest();
  native_jsTest();
  native_proxyTest();
  native_destroyTest();
  native_loadTest();
  native_blanklessTest();
  native_engineTest();
  native_cookieTest();
}
