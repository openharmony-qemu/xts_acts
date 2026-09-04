/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { getNpmPrimaryUrl, getNpmBackupUrl } from './DownloadUrlConfig';

export class DownloadFallbackManager {
  private controller: webview.WebviewController;
  private version: string;
  private attemptCount: number = 0;
  private readonly maxAttempts: number = 3;
  private fallbackTimer: number = -1;
  private readonly fallbackTimeoutMs: number = 10000;
  private resultEmitted: boolean = false;
  private onPassThrough: () => void;
  private currentUrl: string = '';
  private usingBackup: boolean = false;

  constructor(
    controller: webview.WebviewController,
    version: string,
    onPassThrough: () => void
  ) {
    this.controller = controller;
    this.version = version;
    this.onPassThrough = onPassThrough;
  }

  getCurrentUrl(): string {
    return this.currentUrl;
  }

  startDownload(): void {
    this.attemptCount = 0;
    this.resultEmitted = false;
    this.usingBackup = false;
    this.currentUrl = getNpmPrimaryUrl(this.version);
    this.scheduleFallbackTimer();
    try {
      this.controller.startDownload(this.currentUrl);
    } catch (error) {
      console.error('[DownloadFallback] startDownload error: ' + JSON.stringify(error));
      this.advanceFallback('startDownload exception');
    }
  }

  handleDownloadFailed(): void {
    if (this.resultEmitted) {
      return;
    }
    this.advanceFallback('download failed');
  }

  handleDownloadSuccess(): void {
    this.resultEmitted = true;
    this.clearFallbackTimer();
  }

  handleDownloadTimeout(): void {
    if (this.resultEmitted) {
      return;
    }
    this.advanceFallback('download timeout');
  }

  private advanceFallback(reason: string): void {
    this.clearFallbackTimer();
    this.attemptCount++;
    console.info(`[DownloadFallback] ${reason}, attempt ${this.attemptCount}/${this.maxAttempts}, version ${this.version}`);
    if (this.attemptCount === 1) {
      this.usingBackup = true;
      this.currentUrl = getNpmBackupUrl(this.version);
      this.scheduleFallbackTimer();
      try {
        this.controller.startDownload(this.currentUrl);
      } catch (error) {
        console.error('[DownloadFallback] backup startDownload error: ' + JSON.stringify(error));
        this.advanceFallback('backup startDownload exception');
      }
      return;
    }
    if (this.attemptCount < this.maxAttempts) {
      this.scheduleFallbackTimer();
      try {
        this.controller.startDownload(this.currentUrl);
      } catch (error) {
        console.error('[DownloadFallback] retry startDownload error: ' + JSON.stringify(error));
        this.advanceFallback('retry startDownload exception');
      }
      return;
    }
    this.emitPassThrough();
  }

  private emitPassThrough(): void {
    if (this.resultEmitted) {
      return;
    }
    this.resultEmitted = true;
    this.clearFallbackTimer();
    console.info('[DownloadFallback] all download attempts failed, pass through');
    this.onPassThrough();
  }

  private scheduleFallbackTimer(): void {
    this.clearFallbackTimer();
    if (this.resultEmitted) {
      return;
    }
    this.fallbackTimer = setTimeout(() => {
      this.fallbackTimer = -1;
      this.handleDownloadTimeout();
    }, this.fallbackTimeoutMs);
  }

  private clearFallbackTimer(): void {
    if (this.fallbackTimer >= 0) {
      clearTimeout(this.fallbackTimer);
      this.fallbackTimer = -1;
    }
  }
}
