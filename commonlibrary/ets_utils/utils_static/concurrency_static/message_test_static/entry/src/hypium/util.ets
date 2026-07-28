'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Core } from './core';
import { ConfigService } from './module/config/configService';
import { ItfnType, HypiumValue } from './module/types/common';
import { TAG } from './Constant';

// Test callback return: sync void or Promise; not ArkTS Any.
type FuncResult = void | Promise<void>;

export function getFuncWithArgsZero(func: () => FuncResult, timeout: int, isStressTest: boolean): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    let timer = 0;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }
    let res: FuncResult | undefined = undefined;
    try {
      res = func();
    } catch (err) {
      const errMsg = err instanceof Error ? err.message : String(err);
      console.info(`${TAG} getFuncWithArgsZero Error: ${errMsg}`);
      reject(err instanceof Error ? err : new Error(errMsg));
    }
    if (res instanceof Promise) {
      res.then(() => {
        if (!!timer) {
          clearTimeout(timer);
        }
        resolve(Promise.resolve());
      }).catch((err: Error) => {
        console.info(`${TAG} getFuncWithArgsZero Error: ${err.message}`);
        reject(err);
      });
    } else {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    }
  });
}

export function getFuncWithArgsOne(func: (params: () => void) => FuncResult, timeout: int, isStressTest: boolean): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
    let timer = 0;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }

    const done = () => {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    };

    try {
      const res = func(done);
      if (res instanceof Promise) {
        res.catch((err: Error) => {
          if (!!timer) {
            clearTimeout(timer);
          }
          reject(err);
        });
      }
    } catch (err) {
      if (!!timer) {
        clearTimeout(timer);
      }
      reject(err instanceof Error ? err : new Error(String(err)));
    }
  });
}

export function getFuncWithArgsTwo(
  func: (param1: () => void, param2: HypiumValue) => FuncResult,
  timeout: int,
  paramItem: HypiumValue,
  isStressTest: boolean
): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
    let timer = 0;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }

    const done = () => {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    };

    try {
      const res = func(done, paramItem);
      if (res instanceof Promise) {
        res.catch((err: Error) => {
          if (!!timer) {
            clearTimeout(timer);
          }
          reject(err);
        })
      }
    } catch (err) {
      if (!!timer) {
        clearTimeout(timer);
      }
      reject(err instanceof Error ? err : new Error(String(err)));
    }
  });
}

export function processFunc(
  coreContext: Core,
  func: () => FuncResult,
  itTimeout?: number
): () => Promise<void> {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const runnerTimeout = !config.timeout ? 5000 : Number(config.timeout);
    let timeout = runnerTimeout;
    if (itTimeout !== undefined) {
      if (Number.isFinite(itTimeout) && itTimeout > 0) {
        timeout = itTimeout;
      }
    }
    let isStressTest = false;
    if (config.getStress() > 1 || coreContext.getServices('dataDriver')) {
      isStressTest = true;
    } else {
      isStressTest = false;
    }
    return () => {
      return getFuncWithArgsZero(func, timeout.toInt(), isStressTest);
    };
  }
  return () => {
    return getFuncWithArgsZero(func, 0, false);
  };
}

export function processFuncWithArgOne(coreContext: Core, func: (done: () => void) => FuncResult, itTimeout?: number): () => Promise<void> {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const runnerTimeout = !config.timeout ? 5000 : Number(config.timeout);
    let timeout = runnerTimeout;
    if (itTimeout !== undefined) {
      if (Number.isFinite(itTimeout) && itTimeout > 0) {
        timeout = itTimeout;
      }
    }
    const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
    return () => {
      return getFuncWithArgsOne(func, timeout.toInt(), isStressTest);
    };
  }
  return () => {
    return getFuncWithArgsOne(func, 0, false);
  };
}

export function processFuncWithArgTwo(coreContext: Core, func: (param1: () => void, param2: HypiumValue) => FuncResult,
  itTimeout?: number): (paramItem: HypiumValue) => Promise<void> {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const runnerTimeout = !config.timeout ? 5000 : Number(config.timeout);
    let timeout = runnerTimeout;
    if (itTimeout !== undefined) {
      if (Number.isFinite(itTimeout) && itTimeout > 0) {
        timeout = itTimeout;
      }
    }
    const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
    return (paramItem: HypiumValue) => {
      return getFuncWithArgsTwo(func, timeout.toInt(), paramItem, isStressTest);
    };
  }
  return (paramItem: HypiumValue) => {
    return getFuncWithArgsTwo(func, 0, paramItem, false);
  };
}

export function getFunctionArgumentsCount(func: ItfnType): int {
  // Use Any on RHS of instanceof — concrete param types (void/HypiumValue) are ESE38251.
  if (func instanceof (() => never)) {
    return 0;
  } else if (func instanceof ((done: Any) => never)) {
    return 1;
  } else if (func instanceof ((done: Any, arg2: Any) => never)) {
    return 2;
  }
  return 0;
}
