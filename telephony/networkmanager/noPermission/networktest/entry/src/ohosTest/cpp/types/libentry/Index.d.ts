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

export enum IPMatchType {
  IP_MATCH_ANY = 0,
  IP_MATCH_SINGLE = 1,
  IP_MATCH_CIDR = 2,
  IP_MATCH_RANGE = 3,
  IP_MATCH_MULTI = 4
}


export enum IPFamily {
  IP_FAMILY_UNSPEC = 0,
  IP_FAMILY_V4 = 1,
  IP_FAMILY_V6 = 2
}

export enum PortMatchType {
  PORT_MATCH_ANY = 0,
  PORT_MATCH_SINGLE = 1,
  PORT_MATCH_RANGE = 2,
  PORT_MATCH_MULTI = 3
}

export enum HookPoint {
  HOOK_INPUT = 0,
  HOOK_OUTPUT = 1,
  HOOK_FORWARD = 2,
  HOOK_PREROUTING = 3,
  HOOK_POSTROUTING = 4
}

export enum ErrCode {
  OK = 0,
  ERROR_PERMISSION_DENIED = 201,
  ERROR_INVALID_PARAM = 29410101,
  ERROR_NOT_FOUND = 29410102,
  ERROR_TOO_MANY_RULES = 29410103,
  ERROR_GROUP_ID_IN_USE = 29410104,
  ERROR_NFQUEUE_ERROR = 29410105
}

export interface IPAddress {
  family: IPFamily;
  addr: string[];
}

interface IPCidrValue {
  base: IPAddress,
  prefixLen: number
}
interface IPRangeValue {
  start: IPAddress,
  end: IPAddress
}

interface IPMultiValue {
  ips:IPAddress[]
}

export interface IPMatch {
  type: IPMatchType;
  invert: boolean;
  value?: IPAddress | IPMultiValue | IPRangeValue | IPCidrValue;
}

interface PortRange {
  startPort: number,
  endPort: number
}

interface PortMulti {
  ports: number[]
}

export interface PortMatch {
  type: PortMatchType;
  invert: boolean;
  value?: number | PortRange | PortMulti;
}

export interface InterfaceMatch {
  enabled: boolean;
  invert: boolean;
  isPrefix: boolean;
  ifName: string;
}

export interface RuleConfig {
  priority: number;
  hookPoint: HookPoint;
  protocol: number;
  srcIp: IPMatch;
  srcPort: PortMatch;
  dstIp: IPMatch;
  dstPort: PortMatch;
  inInterface: InterfaceMatch;
  outInterface: InterfaceMatch;
  uidStart: number;
  uidEnd: number;
  proxyIp: IPAddress;
  proxyPort: number;
}

export interface ConnectionInfo {
  srcIp: IPAddress;
  srcPort: number;
  dstIp: IPAddress;
  dstPort: number;
  protocol: number;
}

export interface ProcessInfo {
  ret: number,
  size?: number,
  pid?: number,
  uid?: number,
}

export interface CreateRedirectInfo {
  redirector: null | number,
  ret: number
}

export const CreateRedirector: (groupId: number, priority: number) => CreateRedirectInfo;
export const CreateRedirectorIsNull: (groupId: number, priority: number) => CreateRedirectInfo;
export const DestroyRedirector: (redirector: null | number) => number;
export const AddRedirectRule: (redirector: null | number, rule: RuleConfig | null) => number;
export const ClearRedirectRule: (redirector: null | number) => number;
export const QueryProcess: (connection: ConnectionInfo) => ProcessInfo;
export const AddNullPtrReadOnlyRequestInterceptor: () => number;
export const AddNullPtrWritableResponseInterceptor: () => number;
export const AddReadOnlyRequestInterceptor: (groupId: number, enabled: number) => number;
export const AddReadOnlyResponseInterceptor: (groupId: number, enabled: number) => number;
export const AddWritableRequestInterceptor: (groupId: number, enabled: number) => number;
export const AddWritableResponseInterceptor: (groupId: number, enabled: number) => number;
export const StopAllInterceptor: (groupId: number) => number;
export const RemoveAllInterceptor: (groupId: number) => number;
export const RemoveRequestInterceptor: (groupId: number) => number;
export const RemoveResponseInterceptor: (groupId: number) => number;
export const RemoveNullptrInterceptor: () => number;
export const StartAllInterceptor: (groupId: number) => number;
export const TestCHttpRequest: (url: string) => number;
export const RegisterInterceptorCallback: (callbackId: string, callback: (request: string, interceptorName: string) => void) => number;
export const UnregisterCallback: (callbackId: string) => number;