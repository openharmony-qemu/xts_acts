import scrollTest from './Scroll.test';
import requestHeaderTest from './RequestHeader.test';
import resourceRequestTest from './ResourceRequest.test';
import httpBodyStreamTest from './HttpBodyStream.test';
import schemeHandlerTest from './SchemeHandler.test';
import responseTest from './Response.test';
import resourceHandlerTest from './ResourceHandler.test';
import releaseTest from './Release.test';
import nativeJsTest from './NativeJs.test';
import nativeProxyTest from './NativeProxy.test';
import nativeDestroyTest from './NativeDestroy.test';
import nativeLoadTest from './NativeLoad.test';
import nativeBlanklessTest from './NativeBlankless.test';
import nativeEngineTest from './NativeEngine.test';
import nativeCookieTest from './NativeCookie.test';
import nativeModuleLoadTest from './NativeModuleLoad.test';

export default function testsuite() {
  nativeModuleLoadTest();
  scrollTest();
  requestHeaderTest();
  resourceRequestTest();
  httpBodyStreamTest();
  schemeHandlerTest();
  responseTest();
  resourceHandlerTest();
  releaseTest();
  nativeJsTest();
  nativeProxyTest();
  nativeDestroyTest();
  nativeLoadTest();
  nativeBlanklessTest();
  nativeEngineTest();
  nativeCookieTest();
}
