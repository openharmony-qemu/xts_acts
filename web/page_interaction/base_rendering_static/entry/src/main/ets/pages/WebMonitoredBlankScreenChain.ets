'use static';
import { Component, Web } from '@ohos.arkui.component';
import web_webview from '@ohos.web.webview';
import { onMonitoredBlankScreenHandle } from './WebMonitoredBlankScreenCallback';

/** Declarative chain: enableBlankScreenMonitor(true).onMonitoredBlankScreen(...) */
@Component
export struct WebMonitoredBlankScreenChain {
  controllerChain: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build(): void {
    Web({ src: 'resource://rawfile/1text.html', controller: this.controllerChain })
      .javaScriptAccess(true)
      .enableBlankScreenMonitor(true)
      .onMonitoredBlankScreen(onMonitoredBlankScreenHandle)
  }
}
