'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class TestClass {
  public constructor () {}
  public sum(a: int, b: int): int {
    return a + b;
  }

  public newClass (): TestClass{
    return new TestClass();
  }

  static multiply(a: number, b: number): number {
    return a * b;
  }

}

export class Foo {
  native test_GetVersion(): int;
  native test_AttachDetach(): int;
  native test_AttachDetach_WithInterop(): int;
  native test_Attach_InvalidResult(): int;
  native test_Attach_InvalidVersion(): int;
  native test_Attach_InvalidOption(): int;
  native test_Attach_RepeatAttach(): int;
  native test_Attach_RepeatDetach(): int;
  native test_Detach_WithoutAttach(): int;
  native test_ConcurrentAttach(): int;
  native test_ConcurrentMainThreadWorker(): int;
  native test_CreateObjectInWorker(): int;
  native test_Attach_DetachThenGetEnvAndReattach(): int;
  native test_Attach_InvalidHighVersion(): int;
  native test_Attach_DisableInterop(): int;
  native test_Attach_FailedAttachStateRecovery(): int;
  native test_Attach_CurrentManagedThreadShouldFail(): int;
  native test_ConcurrentMainThreadWorkerOverlap(): int;
  native test_Attach_LocalScopeStress(): int;

  native testBoxBooleanNative(): boolean;
  native testUnboxBooleanNative(): boolean;
  native testUnboxBooleanExceptionNative(): boolean;
  native testBoxByteNative(): boolean;
  native testBoxByteExceptionNative(): boolean;
  native testUnboxByteNative(): boolean;
  native testBoxCharNative(): boolean;
  native testBoxCharExceptionNative(): boolean;
  native testUnboxCharNative(): boolean;
  native testUnboxCharExceptionNative(): boolean;
  native testBoxDoubleNative(): boolean;
  native testBoxDoubleExceptionNative(): boolean;
  native testUnboxDoubleNative(): boolean;
  native testUnboxDoubleExceptionNative(): boolean;
  native testBoxFloatNative(): boolean;
  native testBoxFloatExceptionNative(): boolean;
  native testUnboxFloatNative(): boolean;
  native testUnboxFloatExceptionNative(): boolean;
  native testBoxIntNative(): boolean;
  native testBoxIntExceptionNative(): boolean;
  native testUnboxIntNative(): boolean;
  native testUnboxIntExceptionNative(): boolean;
  native testBoxLongNative(): boolean;
  native testBoxLongExceptionNative(): boolean;
  native testUnboxLongNative(): boolean;
  native testUnboxLongExceptionNative(): boolean;
  native testBoxShortNative(): boolean;
  native testBoxShortExceptionNative(): boolean;
  native testUnboxShortNative(): boolean;
  native testUnboxShortExceptionNative(): boolean;
  native testStabilityLoop1000NormalNative(): boolean;
  native testStabilityLoop1000ExceptionNative(): boolean;
  native testStability10ThreadsNormalNative(): boolean;
  native testStability10ThreadsExceptionNative(): boolean;
  
  constructor() {
  }

  public static new_Foo(): Foo {
    return new Foo();
  }
  static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
  static sum(a0: int, a1: int): int {
    return a0 + a1;
  }

  stringValue: string = 'test';
}