'use static';

import  WebDownloadEnumTest from './WebDownloadEnumTest.test'
import  WebInitTest from './WebInitTest.test'
import  webResourceError from './WebResourceError.test'
import WebResourceErrorConstructor from './WebResourceErrorConstructor.test'
export default function testsuite() {
  WebDownloadEnumTest();
  WebInitTest();
  webResourceError();
  WebResourceErrorConstructor()
}
