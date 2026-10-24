/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// SDK 26.0.1 BlankScreenReason values. Dynamic ohosTest has no runtime BlankScreenReason enum;
// static tests import from @ohos.arkui.component, dynamic page/tests use these constants instead.
export const REASON_DNS_RESOLVE_FAILED = 101;
export const REASON_REQUEST_TIMED_OUT = 102;
export const REASON_CONNECTION_REFUSED = 103;
export const REASON_CONNECTION_RESET = 104;
export const REASON_SSL_ERROR = 105;
export const REASON_CERT_ERROR = 106;
export const REASON_INTERNET_DISCONNECTED = 107;
export const REASON_REDIRECT_LOOP = 108;
export const REASON_PROXY_ERROR = 109;
export const REASON_OTHER_NETWORK_ERROR = 199;
export const REASON_MAIN_DOC_EMPTY = 201;
export const REASON_HTTP_4XX_ERROR = 202;
export const REASON_HTTP_5XX_ERROR = 203;
export const REASON_JS_GLOBAL_BUNDLE_LOAD_FAILED = 210;
export const REASON_CSS_LOAD_FAILED = 211;
export const REASON_MULTI_RESOURCE_LOAD_FAILED = 212;
export const REASON_CORS_BLOCKED = 213;
export const REASON_CSP_BLOCKED = 214;
export const REASON_MIXED_CONTENT_BLOCKED = 215;
export const REASON_JS_RUNTIME_ERROR = 301;
export const REASON_NO_FIRST_CONTENTFUL_PAINT = 312;
export const REASON_RENDERER_CRASHED = 401;
export const REASON_RENDERER_KILLED = 402;
export const REASON_GPU_PROCESS_CRASHED = 403;
export const REASON_GPU_PROCESS_WATCHDOG_TIMEOUT = 404;
export const REASON_WEB_VIEW_ZERO_SIZE = 501;
