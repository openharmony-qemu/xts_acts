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

export enum IPType {
    IP_ANY = 0,
    IP_SINGLE = 1,
    IP_CIDR = 2,
    IP_RANGE = 3,
    IP_MULTI = 4
  }
  
  export enum IPFamilyType {
    FAMILY_UNSPEC = 0,
    FAMILY_V4 = 1,
    FAMILY_V6 = 2
  }
  
  export enum PortType {
    PORT_ANY = 0,
    PORT_SINGLE = 1,
    PORT_RANGE = 2,
    PORT_MULTI = 3
  }
  
  export enum HookPointType {
    INPUT = 0,
    OUTPUT = 1,
    FORWARD = 2,
    PREROUTING = 3,
    POSTROUTING = 4
  }
  
  export enum FlagMask {
    TCP_FLAG_SYN = 0x01,
    TCP_FLAG_ACK = 0x02,
    TCP_FLAG_FIN = 0x04,
    TCP_FLAG_RST = 0x08,
    TCP_FLAG_PSH = 0x10,
    TCP_FLAG_URG = 0x20,
    TCP_FLAG_ALL = 0x3F,
    TCP_FLAG_NONE = 0x00
  }
  
  export enum StateMask {
    CT_STATE_ANY = 0x00,
    CT_STATE_NEW = 0x01,
    CT_STATE_ESTABLISHED = 0x02,
    CT_STATE_RELATED = 0x04,
    CT_STATE_INVALID = 0x08,
    CT_STATE_UNTRACKED = 0x10,
  }
  
  export enum packetCallback {
    Accept = 0,
    Reject = 1
  }
  
  export enum PacketCopyMode {
    COPY_MODE_META = 0,
    COPY_MODE_HEADER = 1,
    COPY_MODE_FULL = 2,
    COPY_MODE_MAXLEN = 3
  }
  
  export interface IPAddress {
    family: IPFamilyType;
    addr: string[];
  }
  
  export interface IPCidrValue {
    base: IPAddress;
    prefixLen: number;
  }
  
  export interface IPRangeValue {
    start: IPAddress;
    end: IPAddress;
  }
  
  export interface IPMultiValue {
    ips: IPAddress[];
  }
  
  export interface IPMatch {
    type: IPType;
    invert: boolean;
    value?: Object;
  }
  
  export interface PortRange {
    startPort: number;
    endPort: number;
  }
  
  export interface PortMulti {
    ports: number[];
  }
  
  export interface PortMatch {
    type: PortType;
    invert: boolean;
    value?: Object;
  }
  
  export interface InterfaceMatch {
    enabled: boolean;
    invert: boolean;
    isPrefix: boolean;
    ifName: string;
  }
  
  export interface MacMatch {
    enable: boolean;
    invert: boolean;
    srcMac: string[];
  }
  
  export interface TcpFlagsMatch {
    enable: boolean;
    flagMask: FlagMask;
    flagComp: number;
  }
  
  export interface ConntrackMatch {
    enable: boolean;
    stateMask: StateMask;
  }
  
  export interface Rule {
    priority: number;
    hookPoint: HookPointType;
    protocol: number;
    srcIp: IPMatch;
    srcPort: PortMatch;
    dstIp: IPMatch;
    dstPort: PortMatch;
    inInterface: InterfaceMatch;
    outInterface: InterfaceMatch;
    uidStart?: number;
    uidEnd?: number;
    macMatch?: MacMatch;
    tcpFlagsMatch?: TcpFlagsMatch;
    conntrackMatch?: ConntrackMatch;
  }
  
  export interface Packet {
    packetId: number;
    protocol: number;
    srcIp: IPMatch;
    srcPort: PortMatch;
    dstIp: IPMatch;
    dstPort: PortMatch;
    packetLen: number;
    user_data: string;
  }
  
  export interface createPacketInfo {
    id: number;
    ret: number;
  }
  
  export const createPacketController: (
    groupId: number,
    priority: number,
    packetCopyLen?: number,
    nfqueueMaxlen?: number,
    nfqueueFlags?: number,
    packetCopyMode?: PacketCopyMode
  ) => createPacketInfo;
  export const destroyPacketController: (id: number) => number;
  export const addPacketRule: (id: number, rule: Rule) => number;
  export const clearPacketRule: (id: number) => number;
  export const registerPacketCallback: (
    id: number,
    user_data: string,
    callback: (packet: Packet, user_data: string) => packetCallback
  ) => number;
  export const unregisterPacketCallback: (id: number) => number;
  