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

/** onMonitoredBlankScreen(undefined) chain return this */
@Component
export struct WebMonitoredBlankScreenUndefinedReturn {
  controllerUndefinedReturn: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build(): void {
    Web({ src: 'resource://rawfile/1text.html', controller: this.controllerUndefinedReturn })
      .onMonitoredBlankScreen(undefined)
      .javaScriptAccess(true)
  }
}

/** enableBlankScreenMonitor(undefined) chain return this */
@Component
export struct WebMonitoredBlankScreenEnableUndefinedReturn {
  controllerEnableUndefinedReturn: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build(): void {
    Web({ src: 'resource://rawfile/1text.html', controller: this.controllerEnableUndefinedReturn })
      .enableBlankScreenMonitor(undefined)
      .javaScriptAccess(true)
  }
}
