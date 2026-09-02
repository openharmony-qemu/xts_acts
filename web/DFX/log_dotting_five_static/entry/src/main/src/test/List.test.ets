'use static';

import  WebDownloadEnumTest from './WebDownloadEnumTest.test'
import  WebInitTest from './WebInitTest.test'
import  webResourceError from './WebResourceError.test'
import WebResourceErrorConstructor from './WebResourceErrorConstructor.test'
import webCustomErrorCodeStatic from './WebCustomErrorCodeStatic.test'
export default function testsuite(): void {
  WebDownloadEnumTest();
  WebInitTest();
  webResourceError();
  WebResourceErrorConstructor()
  webCustomErrorCodeStatic()
}
