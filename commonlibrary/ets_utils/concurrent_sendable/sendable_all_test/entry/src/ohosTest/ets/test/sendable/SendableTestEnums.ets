/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

export enum ApprovalState {
  DRAFT = 0,
  PENDING = 1,
  APPROVING = 2,
  APPROVED = 3,
  REJECTED = 4,
  WITHDRAWN = 5
}

export enum DeviceState {
  OFFLINE = 0,
  ONLINE = 1,
  BUSY = 2,
  IDLE = 3,
  ERROR = 4
}

export enum Environment {
  DEVELOPMENT = 'dev',
  TESTING = 'test',
  PRODUCTION = 'prod'
}

export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3
}

export enum OrderState {
  CREATED = 0,
  PENDING_PAYMENT = 1,
  PAID = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5,
  REFUNDED = 6
}

export enum RequestType {
  GET = 0,
  POST = 1,
  PUT = 2,
  DELETE = 3
}

export enum ServiceState {
  CREATED = 0,
  INITIALIZED = 1,
  RUNNING = 2,
  STOPPED = 3,
  DESTROYED = 4
}

export enum SimpleState {
  IDLE = 0,
  ACTIVE = 1,
  PAUSED = 2,
  STOPPED = 3
}

export enum TaskState {
  PENDING = 0,
  RUNNING = 1,
  COMPLETED = 2,
  FAILED = 3,
  CANCELLED = 4
}
