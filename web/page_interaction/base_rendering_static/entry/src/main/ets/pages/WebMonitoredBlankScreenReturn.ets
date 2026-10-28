'use static';
import { Component, Web } from '@ohos.arkui.component';
import web_webview from '@ohos.web.webview';
import { onMonitoredBlankScreenHandle } from './WebMonitoredBlankScreenCallback';

/** Chain return this: onMonitoredBlankScreen(...).javaScriptAccess(true) */
@Component
export struct WebMonitoredBlankScreenReturn {
  controllerReturn: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build(): void {
    Web({ src: 'resource://rawfile/1text.html', controller: this.controllerReturn })
      .onMonitoredBlankScreen(onMonitoredBlankScreenHandle)
      .javaScriptAccess(true)
  }
}

@Component
export struct WebMonitoredBlankScreenEnableReturn {
  controllerEnableReturn: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build(): void {
    Web({ src: 'resource://rawfile/1text.html', controller: this.controllerEnableReturn })
      .enableBlankScreenMonitor(true)
      .javaScriptAccess(true)
  }
}
