/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

#include "Common.h"
#include "TcBindTest.h"
#include "TcManglingTest.h"
#include "TcTypeTest.h"
#include "TcParamTest.h"
#include "TcCreateTest.h"
#include "TcIfaceTest.h"
#include "TcFuncTest.h"
#include "TcAsyncTest.h"
#include "TcMtTest.h"
#include "TcArrayTest.h"
#include "TcFixedArrayTest.h"
#include "TcValueArrayTest.h"
#include "TcArrayBufferTest.h"
#include "TcEnumTest.h"
#include "TcErrorCodeTest.h"
#include "TcFaqTest.h"
#include "TcBigIntTest.h"
#include "TcContainerTest.h"
#include "TcLifecycleTest.h"
#include "TcExceptionTest.h"
#include "TcStringTest.h"
#include "TcOptTest.h"
#include "TcLoadLibTest.h"
#include "TcErrorTest.h"
#include "TcDisasmTest.h"
#include <utility>
#include "AniTest.h"
#include "NativeObjectStorageTest.h"
#include "ThreadSafeStorageTest.h"
#include "ConcurrentStorageTest.h"
#include "ClassStorageTest.h"
#include "MapKeyStorageTest.h"
#include "ExceptionStorageTest.h"
#include "AniObjectTypeTest.h"
#include "ContainerStorageTest.h"

namespace {
constexpr const char *MODULE_NAME = "entry.src.main.src.ets.Index";
constexpr const char *NAMESPACE_NAME = "entry.src.main.src.ets.Index.Convert";
std::array loadLibModuleMethods = {
    ani_native_function{"add", "ii:i",
        reinterpret_cast<void *>(add)},
    ani_native_function{"getLoadLibNativeCallCount", ":i",
        reinterpret_cast<void *>(getLoadLibNativeCallCount)},
};
std::array errorModuleMethods = {
    ani_native_function{"test_SimulateFindClassFailure", ":C{std.core.String}",
        reinterpret_cast<void *>(simulateFindClassFailure)},
};
std::array errorExpectedFailureModuleMethods = {
    ani_native_function{"test_ErrorAdd", "dd:d",
        reinterpret_cast<void *>(errorAddWrongSignature)},
};
std::array disasmInstanceMethods = {
    ani_native_function{"test_InstanceAdd", "i:i",
        reinterpret_cast<void *>(test_InstanceAdd)},
    ani_native_function{"test_Overload", ":i",
        reinterpret_cast<void *>(test_OverloadVoid)},
    ani_native_function{"test_Overload", "C{std.core.String}:i",
        reinterpret_cast<void *>(test_OverloadString)},
};
std::array disasmStaticMethods = {
    ani_native_function{"test_StaticSquare", "i:i",
        reinterpret_cast<void *>(test_StaticSquare)},
};
std::array bindInstanceMethods = {
    ani_native_function{"test_Multiply", "i:i", reinterpret_cast<void *>(test_Multiply)},
    ani_native_function{"test_FooOverload", ":", reinterpret_cast<void *>(test_FooOverloadVoid)},
    ani_native_function{"test_FooOverload", "C{std.core.String}:",
        reinterpret_cast<void *>(test_FooOverloadString)},
    ani_native_function{"test_CheckFooOverload", ":z",
        reinterpret_cast<void *>(test_CheckFooOverload)},
    ani_native_function{"test_Log", "iC{std.core.String}:",
        reinterpret_cast<void *>(test_Log)},
    ani_native_function{"test_CheckLog", ":z",
        reinterpret_cast<void *>(test_CheckLog)},
};
std::array bindStaticMethods = {
    ani_native_function{"test_Square", "i:i", reinterpret_cast<void *>(test_Square)},
};
std::array bindModuleMethods = {
    ani_native_function{"test_ProcessColorNative",
        "E{entry.src.main.src.ets.Index.COLOR}:i",
        reinterpret_cast<void *>(test_ProcessColor)},
};
std::array bindNamespaceMethods = {
    ani_native_function{"toUpper", "C{std.core.String}:C{std.core.String}",
        reinterpret_cast<void *>(test_ToUpper)},
};
std::array manglingInstanceMethods = {
    ani_native_function{"test_SumDouble", "dd:d",
        reinterpret_cast<void *>(test_SumDouble)},
    ani_native_function{"test_ManglingConcat",
        "C{std.core.String}C{std.core.String}:C{std.core.String}",
        reinterpret_cast<void *>(test_ManglingConcat)},
    ani_native_function{"test_IsEqual", "zz:z",
        reinterpret_cast<void *>(test_IsEqual)},
    ani_native_function{"test_FuncPrimitive", "zbcsilfd:d",
        reinterpret_cast<void *>(test_FuncPrimitive)},
    ani_native_function{"test_UseNumber", "d:d",
        reinterpret_cast<void *>(test_UseNumber)},
    ani_native_function{"test_UseDouble", "d:d",
        reinterpret_cast<void *>(test_UseDouble)},
    ani_native_function{"test_RequiredInt", "i:",
        reinterpret_cast<void *>(test_RequiredInt)},
    ani_native_function{"test_OptionalInt", "C{std.core.Int}:",
        reinterpret_cast<void *>(test_OptionalInt)},
    ani_native_function{"test_CheckOptionalInt", ":z",
        reinterpret_cast<void *>(test_CheckOptionalInt)},
    ani_native_function{"test_ProcessPerson",
        "C{entry.src.main.src.ets.Index.Person}:C{std.core.String}",
        reinterpret_cast<void *>(test_ProcessPerson)},
    ani_native_function{"test_CheckRun",
        "C{entry.src.main.src.ets.Index.CanRun}:z",
        reinterpret_cast<void *>(test_CheckRun)},
    ani_native_function{"test_ManglingConcatString",
        "C{std.core.String}C{std.core.String}:C{std.core.String}",
        reinterpret_cast<void *>(test_ManglingConcatString)},
    ani_native_function{"test_AddBigInt",
        "C{std.core.BigInt}C{std.core.BigInt}:C{std.core.BigInt}",
        reinterpret_cast<void *>(test_AddBigInt)},
    ani_native_function{"test_SumArray", "C{std.core.Array}:d",
        reinterpret_cast<void *>(test_SumArray)},
    ani_native_function{"test_SumArray2", "C{std.core.Array}:d",
        reinterpret_cast<void *>(test_SumArray2)},
    ani_native_function{"test_ProcessUnion",
        "X{C{std.core.Double}C{std.core.String}}:C{std.core.String}",
        reinterpret_cast<void *>(test_ProcessUnion)},
    ani_native_function{"test_ComplexOptional",
        "iC{std.core.Int}C{std.core.String}C{entry.src.main.src.ets.Index.A}:",
        reinterpret_cast<void *>(test_ComplexOptional)},
    ani_native_function{"test_CheckComplexOptional", ":z",
        reinterpret_cast<void *>(test_CheckComplexOptional)},
    ani_native_function{"test_OptionalBasicAndRef",
        "C{std.core.Int}C{std.core.String}C{entry.src.main.src.ets.Index.A}:",
        reinterpret_cast<void *>(test_OptionalBasicAndRef)},
    ani_native_function{"test_CheckOptionalBasicAndRef", ":z",
        reinterpret_cast<void *>(test_CheckOptionalBasicAndRef)},
    ani_native_function{"test_ExecFunction",
        "C{std.core.Function0}C{std.core.Function0}C{std.core.FunctionR1}:",
        reinterpret_cast<void *>(test_ExecFunction)},
    ani_native_function{"test_CheckExecFunction", ":z",
        reinterpret_cast<void *>(test_CheckExecFunction)},
    ani_native_function{"test_GenericFunc",
        "X{C{entry.src.main.src.ets.Index.I1}C{entry.src.main.src.ets.Index.I2}}:"
        "X{C{entry.src.main.src.ets.Index.I1}C{entry.src.main.src.ets.Index.I2}}",
        reinterpret_cast<void *>(test_GenericFunc)},
    ani_native_function{"test_DoNothing", ":",
        reinterpret_cast<void *>(test_DoNothing)},
    ani_native_function{"test_CheckDoNothing", ":z",
        reinterpret_cast<void *>(test_CheckDoNothing)},
    ani_native_function{"test_DoNothingAgain", ":",
        reinterpret_cast<void *>(test_DoNothingAgain)},
    ani_native_function{"test_CheckDoNothingAgain", ":z",
        reinterpret_cast<void *>(test_CheckDoNothingAgain)},
    ani_native_function{"test_UseMyClass",
        "C{entry.src.main.src.ets.Index.MyClass}:",
        reinterpret_cast<void *>(test_UseMyClass)},
    ani_native_function{"test_CheckUseMyClass", ":z",
        reinterpret_cast<void *>(test_CheckUseMyClass)},
};
std::array typeInstanceMethods = {
    ani_native_function{"test_IsPositive", "i:z",
        reinterpret_cast<void *>(test_IsPositive)},
    ani_native_function{"test_GetCharCode", "c:i",
        reinterpret_cast<void *>(test_GetCharCode)},
    ani_native_function{"test_EchoByte", "b:b",
        reinterpret_cast<void *>(test_EchoByte)},
    ani_native_function{"test_EchoShort", "s:s",
        reinterpret_cast<void *>(test_EchoShort)},
    ani_native_function{"test_EchoInt", "i:i",
        reinterpret_cast<void *>(test_EchoInt)},
    ani_native_function{"test_EchoLong", "l:l",
        reinterpret_cast<void *>(test_EchoLong)},
    ani_native_function{"test_EchoFloat", "f:f",
        reinterpret_cast<void *>(test_EchoFloat)},
    ani_native_function{"test_EchoDouble", "d:d",
        reinterpret_cast<void *>(test_EchoDouble)},
    ani_native_function{"test_ProcessNumber", "d:d",
        reinterpret_cast<void *>(test_ProcessNumber)},
    ani_native_function{"test_CreateGreeting", "C{std.core.String}:C{std.core.String}",
        reinterpret_cast<void *>(test_CreateGreeting)},
    ani_native_function{"test_WriteToBuffer", "C{std.core.ArrayBuffer}ii:",
        reinterpret_cast<void *>(test_WriteToBuffer)},
    ani_native_function{"test_TypeSumArray", "C{std.core.Array}:d",
        reinterpret_cast<void *>(test_TypeSumArray)},
    ani_native_function{"test_IdentifyString", "X{C{std.core.ArrayBuffer}C{std.core.String}}:C{std.core.String}",
        reinterpret_cast<void *>(test_Identify)},
    ani_native_function{"test_IdentifyArrayBuffer", "X{C{std.core.ArrayBuffer}C{std.core.String}}:C{std.core.String}",
        reinterpret_cast<void *>(test_Identify)},
    ani_native_function{"test_CallWithCallback", "C{std.core.Function0}:C{std.core.String}",
        reinterpret_cast<void *>(test_CallWithCallback)},
    ani_native_function{"test_GetEnumValue", "E{entry.src.main.src.ets.Index.TypeColor}:i",
        reinterpret_cast<void *>(test_GetEnumValue)},
};
std::array paramInstanceMethods = {
    ani_native_function{"test_ParamBoxInt", "i:C{std.core.Object}",
        reinterpret_cast<void *>(test_ParamBoxInt)},
    ani_native_function{"test_ParamBoxDouble", "d:C{std.core.Object}",
        reinterpret_cast<void *>(test_ParamBoxDouble)},
    ani_native_function{"test_ParamBoxBoolean", "z:C{std.core.Object}",
        reinterpret_cast<void *>(test_ParamBoxBoolean)},
    ani_native_function{"test_ParamCreateDoubleBoxed", "d:C{std.core.Object}",
        reinterpret_cast<void *>(test_ParamCreateDoubleBoxed)},
    ani_native_function{"test_ParamUnboxDouble", "C{std.core.Object}:d",
        reinterpret_cast<void *>(test_ParamUnboxDouble)},
    ani_native_function{"test_ParamUnboxWithMethod", "C{std.core.Object}:d",
        reinterpret_cast<void *>(test_ParamUnboxWithMethod)},
    ani_native_function{"test_ParamWrongUnbox", "C{std.core.Object}:i",
        reinterpret_cast<void *>(test_ParamWrongUnbox)},
    ani_native_function{"test_ParamIdentify", "X{C{std.core.Double}C{std.core.String}}:C{std.core.String}",
        reinterpret_cast<void *>(test_ParamIdentify)},
    ani_native_function{"test_ParamHandleCI",
        "C{entry.src.main.src.ets.Index.ParamI}:C{std.core.String}",
        reinterpret_cast<void *>(test_ParamHandleCI)},
    ani_native_function{"test_ParamGreet",
        "C{std.core.String}C{std.core.Int}:C{std.core.String}",
        reinterpret_cast<void *>(test_ParamGreet)},
    ani_native_function{"test_ParamCheckOptional", "C{std.core.Int}:z",
        reinterpret_cast<void *>(test_ParamCheckOptional)},
    ani_native_function{"test_ParamProcessOrUndefined", "C{std.core.Double}:C{std.core.String}",
        reinterpret_cast<void *>(test_ParamProcessOrUndefined)},
    ani_native_function{"test_ParamProcessComplexUnion",
        "X{C{std.core.Double}C{std.core.String}}:C{std.core.String}",
        reinterpret_cast<void *>(test_ParamProcessComplexUnion)},
    ani_native_function{"test_ParamFastBoxPerf", "i:l",
        reinterpret_cast<void *>(test_ParamFastBoxPerf)},
    ani_native_function{"test_ParamTraditionalBoxPerf", "i:l",
        reinterpret_cast<void *>(test_ParamTraditionalBoxPerf)},
    ani_native_function{"test_ParamFastUnboxPerf", "i:l",
        reinterpret_cast<void *>(test_ParamFastUnboxPerf)},
    ani_native_function{"test_ParamMethodUnboxPerf", "i:l",
        reinterpret_cast<void *>(test_ParamMethodUnboxPerf)},
};
std::array createInstanceMethods = {
    ani_native_function{"test_CreateArrayBufferIsView", "C{std.core.Object}:z",
        reinterpret_cast<void *>(test_CreateArrayBufferIsView)},
    ani_native_function{"test_CreateArrayBufferByLength", "i:i",
        reinterpret_cast<void *>(test_CreateArrayBufferByLength)},
    ani_native_function{"test_CreateDoubleObject", "d:d",
        reinterpret_cast<void *>(test_CreateDoubleObject)},
    ani_native_function{"test_CreateInterfaceFail", ":",
        reinterpret_cast<void *>(test_CreateInterfaceFail)},
    ani_native_function{"test_CreateAbstractFail", ":",
        reinterpret_cast<void *>(test_CreateAbstractFail)},
    ani_native_function{"test_CreateStringByObjectNew", ":",
        reinterpret_cast<void *>(test_CreateStringByObjectNew)},
    ani_native_function{"test_CreateStringByUtf8", "C{std.core.String}:C{std.core.String}",
        reinterpret_cast<void *>(test_CreateStringByUtf8)},
    ani_native_function{"test_CreateValueArrayByObjectNew", ":",
        reinterpret_cast<void *>(test_CreateValueArrayByObjectNew)},
    ani_native_function{"test_CreateValueArrayBySpecialApi", ":i",
        reinterpret_cast<void *>(test_CreateValueArrayBySpecialApi)},
    ani_native_function{"test_CreateEnumItemByName", ":C{std.core.String}",
        reinterpret_cast<void *>(test_CreateEnumItemByName)},
    ani_native_function{"test_CreateEnumItemIntValue", ":i",
        reinterpret_cast<void *>(test_CreateEnumItemIntValue)},
    ani_native_function{"test_CreateGetByteLength", "i:i",
        reinterpret_cast<void *>(test_CreateGetByteLength)},
    ani_native_function{"test_CreateFindMissing", ":",
        reinterpret_cast<void *>(test_CreateFindMissing)},
    ani_native_function{"test_CreateFindStaticMethod", "C{std.core.Object}:z",
        reinterpret_cast<void *>(test_CreateFindStaticMethod)},
    ani_native_function{"test_CreateFindInstanceMethod", "i:i",
        reinterpret_cast<void *>(test_CreateFindInstanceMethod)},
};
std::array ifaceInstanceMethods = {
    ani_native_function{"test_IfaceObjectNewInterfaceFail", ":z",
        reinterpret_cast<void *>(test_IfaceObjectNewInterfaceFail)},
    ani_native_function{"test_IfaceReadPointLiteral",
        "C{entry.src.main.src.ets.Index.PointI}:i",
        reinterpret_cast<void *>(test_IfaceReadPointLiteral)},
    ani_native_function{"test_IfacePropertyAccess",
        "C{entry.src.main.src.ets.Index.IfacePropC}:z",
        reinterpret_cast<void *>(test_IfacePropertyAccess)},
    ani_native_function{"test_IfaceFieldAccess",
        "C{entry.src.main.src.ets.Index.IfacePoint}:i",
        reinterpret_cast<void *>(test_IfaceFieldAccess)},
    ani_native_function{"test_IfaceGetterSetterAccess",
        "C{entry.src.main.src.ets.Index.IfacePerson}:i",
        reinterpret_cast<void *>(test_IfaceGetterSetterAccess)},
    ani_native_function{"test_IfaceRefPropertyAccess",
        "C{entry.src.main.src.ets.Index.IfacePersonName}:C{std.core.String}",
        reinterpret_cast<void *>(test_IfaceRefPropertyAccess)},
    ani_native_function{"test_IfaceStaticFieldAccess", ":i",
        reinterpret_cast<void *>(test_IfaceStaticFieldAccess)},
    ani_native_function{"test_IfaceCallManagedFunc",
        "C{entry.src.main.src.ets.Index.IfaceManagedFoo}:z",
        reinterpret_cast<void *>(test_IfaceCallManagedFunc)},
    ani_native_function{"test_IfaceCallAdd",
        "C{entry.src.main.src.ets.Index.IfaceManagedFoo}ii:i",
        reinterpret_cast<void *>(test_IfaceCallAdd)},
    ani_native_function{"test_IfaceCallStaticSquare", "i:i",
        reinterpret_cast<void *>(test_IfaceCallStaticSquare)},
    ani_native_function{"test_IfaceCallOptionalFn",
        "C{entry.src.main.src.ets.Index.OptionalClass}:d",
        reinterpret_cast<void *>(test_IfaceCallOptionalFn)},
    ani_native_function{"test_IfaceModifyPoint",
        "C{entry.src.main.src.ets.Index.PointI}:i",
        reinterpret_cast<void *>(test_IfaceModifyPoint)},
    ani_native_function{"test_IfaceCreateWrapper", ":C{std.core.Object}",
        reinterpret_cast<void *>(test_IfaceCreateWrapper)},
    ani_native_function{"test_IfaceUseWrapper", "C{std.core.Object}:i",
        reinterpret_cast<void *>(test_IfaceUseWrapper)},
    ani_native_function{"test_IfaceDeleteWrapper", "C{std.core.Object}:z",
        reinterpret_cast<void *>(test_IfaceDeleteWrapper)},
    ani_native_function{"test_IfaceWrapperWithoutFinalizer", ":z",
        reinterpret_cast<void *>(test_IfaceWrapperWithoutFinalizer)},
    ani_native_function{"test_IfaceCleanupNativeData", ":z",
        reinterpret_cast<void *>(test_IfaceCleanupNativeData)},
    ani_native_function{"test_IfaceWrongPropertyAccess",
        "C{entry.src.main.src.ets.Index.IfacePoint}:z",
        reinterpret_cast<void *>(test_IfaceWrongPropertyAccess)},
    ani_native_function{"test_IfaceWrongFieldAccess",
        "C{entry.src.main.src.ets.Index.IfaceGetterNamePerson}:z",
        reinterpret_cast<void *>(test_IfaceWrongFieldAccess)},
    ani_native_function{"test_IfaceReadDerived",
        "C{entry.src.main.src.ets.Index.IfaceDerived}:C{std.core.String}",
        reinterpret_cast<void *>(test_IfaceReadDerived)},
    ani_native_function{"test_IfaceCallAnimalSpeak",
        "C{entry.src.main.src.ets.Index.Animal}:C{std.core.String}",
        reinterpret_cast<void *>(test_IfaceCallAnimalSpeak)},
};
std::array funcInstanceMethods = {
    ani_native_function{"test_FuncCallCallback", "C{std.core.Function0}:z",
        reinterpret_cast<void *>(test_FuncCallCallback)},
    ani_native_function{"test_FuncCallAdd", "C{std.core.Function2}ii:i",
        reinterpret_cast<void *>(test_FuncCallAdd)},
    ani_native_function{"test_FuncCallMultiplyDouble", "C{std.core.Function2}:d",
        reinterpret_cast<void *>(test_FuncCallMultiplyDouble)},
    ani_native_function{"test_FuncCallGreeting",
        "C{std.core.Function1}:C{std.core.String}",
        reinterpret_cast<void *>(test_FuncCallGreeting)},
    ani_native_function{"test_FuncCallPersonName",
        "C{std.core.Function1}C{entry.src.main.src.ets.Index.FuncPerson}:C{std.core.String}",
        reinterpret_cast<void *>(test_FuncCallPersonName)},
    ani_native_function{"test_FuncCallArgMismatch", "C{std.core.Function2}:z",
        reinterpret_cast<void *>(test_FuncCallArgMismatch)},
    ani_native_function{"test_FuncCallClosure", "C{std.core.Function1}:i",
        reinterpret_cast<void *>(test_FuncCallClosure)},
    ani_native_function{"test_FuncReuseCallback", "C{std.core.Function1}:i",
        reinterpret_cast<void *>(test_FuncReuseCallback)},
    ani_native_function{"test_FuncCatchThrown", "C{std.core.Function0}:z",
        reinterpret_cast<void *>(test_FuncCatchThrown)},
    ani_native_function{"test_FuncPersistentCallback",
        "C{std.core.Function0}:C{std.core.String}",
        reinterpret_cast<void *>(test_FuncPersistentCallback)},
    ani_native_function{"test_FuncRestCallback", "C{std.core.FunctionR0}:i",
        reinterpret_cast<void *>(test_FuncRestCallback)},
};
std::array asyncInstanceMethods = {
    ani_native_function{"test_AsyncHeavyTask", "i:i",
        reinterpret_cast<void *>(test_AsyncHeavyTask)},
    ani_native_function{"test_AsyncHeavyTaskStatus", "i:z",
        reinterpret_cast<void *>(test_AsyncHeavyTaskStatus)},
    ani_native_function{"test_AsyncCompute", "i:i",
        reinterpret_cast<void *>(test_AsyncCompute)},
    ani_native_function{"test_AsyncSaveData", "C{std.core.String}:",
        reinterpret_cast<void *>(test_AsyncSaveData)},
    ani_native_function{"test_AsyncCheckSaveData", "C{std.core.String}:z",
        reinterpret_cast<void *>(test_AsyncCheckSaveData)},
    ani_native_function{"test_AsyncStringTask", "C{std.core.String}:z",
        reinterpret_cast<void *>(test_AsyncStringTask)},
    ani_native_function{"test_AsyncLongRunningTask", "i:i",
        reinterpret_cast<void *>(test_AsyncLongRunningTask)},
    ani_native_function{"test_AsyncWorkLegacy", "i:C{std.core.Promise}",
        reinterpret_cast<void *>(test_AsyncWorkLegacy)},
    ani_native_function{"test_AsyncWorkThrowWithoutCatch", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_AsyncWorkThrowWithoutCatch)},
    ani_native_function{"test_AsyncRaceIncrement", ":i",
        reinterpret_cast<void *>(test_AsyncRaceIncrement)},
    ani_native_function{"test_AsyncGetRaceCounter", ":i",
        reinterpret_cast<void *>(test_AsyncGetRaceCounter)},
    ani_native_function{"test_AsyncResetRaceCounter", ":",
        reinterpret_cast<void *>(test_AsyncResetRaceCounter)},
    ani_native_function{"test_AsyncDoubleTask", "d:d",
        reinterpret_cast<void *>(test_AsyncDoubleTask)},
    ani_native_function{"test_AsyncShortTask", "i:i",
        reinterpret_cast<void *>(test_AsyncShortTask)},
    ani_native_function{"test_AsyncGetUniqueId", ":i",
        reinterpret_cast<void *>(test_AsyncGetUniqueId)},
    ani_native_function{"test_AsyncStoreCallback", "C{std.core.Function1}:z",
        reinterpret_cast<void *>(test_AsyncStoreCallback)},
    ani_native_function{"test_AsyncTriggerStoredCallback", "i:z",
        reinterpret_cast<void *>(test_AsyncTriggerStoredCallback)},
    ani_native_function{"test_AsyncThrowInCompleteNoCatch", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_AsyncThrowInCompleteNoCatch)},
    ani_native_function{"test_AsyncThrowInCompleteWithCatch", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_AsyncThrowInCompleteWithCatch)},
    ani_native_function{"test_AsyncHeavyTaskSync", "i:i",
        reinterpret_cast<void *>(test_AsyncHeavyTaskSync)},
    ani_native_function{"test_AsyncCancelableLongTask", "i:i",
        reinterpret_cast<void *>(test_AsyncCancelableLongTask)},
    ani_native_function{"test_AsyncFibonacci", "i:i",
        reinterpret_cast<void *>(test_AsyncFibonacci)},
    ani_native_function{"test_AsyncSerialFibonacci", "ii:i",
        reinterpret_cast<void *>(test_AsyncSerialFibonacci)},
    ani_native_function{"test_AsyncWorkLegacyLoop", "i:C{std.core.Promise}",
        reinterpret_cast<void *>(test_AsyncWorkLegacyLoop)},
    ani_native_function{"test_AsyncTaskpoolCompare", "i:i",
        reinterpret_cast<void *>(test_AsyncTaskpoolCompare)},
    ani_native_function{"test_AsyncWorkExecuteThrow", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_AsyncWorkExecuteThrow)},
    ani_native_function{"test_AsyncLockedTask", "i:i",
        reinterpret_cast<void *>(test_AsyncLockedTask)},
};
std::array mtInstanceMethods = {
    ani_native_function{"test_MtCreateAndResolvePromise", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_MtCreateAndResolvePromise)},
    ani_native_function{"test_MtCreateAndRejectPromise", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_MtCreateAndRejectPromise)},
    ani_native_function{"test_MtAsyncWorkInThread", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_MtAsyncWorkInThread)},
    ani_native_function{"test_MtCompute", "i:i",
        reinterpret_cast<void *>(test_MtCompute)},
    ani_native_function{"test_MtUseVmAttachThread", ":z",
        reinterpret_cast<void *>(test_MtUseVmAttachThread)},
    ani_native_function{"test_MtAttachGetEnvSame", ":z",
        reinterpret_cast<void *>(test_MtAttachGetEnvSame)},
    ani_native_function{"test_MtAttachWithoutDetach", "i:z",
        reinterpret_cast<void *>(test_MtAttachWithoutDetach)},
    ani_native_function{"test_MtLocalRefWithoutScope", "i:z",
        reinterpret_cast<void *>(test_MtLocalRefWithoutScope)},
    ani_native_function{"test_MtLocalRefWithScope", "i:z",
        reinterpret_cast<void *>(test_MtLocalRefWithScope)},
    ani_native_function{"test_MtConcurrentAttachCounter", "ii:i",
        reinterpret_cast<void *>(test_MtConcurrentAttachCounter)},
    ani_native_function{"test_MtResolvePromiseOnOtherThread", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_MtResolvePromiseOnOtherThread)},
    ani_native_function{"test_MtTaskpoolSafeAdd", "i:i",
        reinterpret_cast<void *>(test_MtTaskpoolSafeAdd)},
    ani_native_function{"test_MtFindClassInNativeThread", ":i",
        reinterpret_cast<void *>(test_MtFindClassInNativeThread)},
};
std::array arrayInstanceMethods = {
    ani_native_function{"test_ArrayCreateEmpty", ":C{std.core.Array}",
        reinterpret_cast<void *>(test_ArrayCreateEmpty)},
    ani_native_function{"test_ArrayGetLength", "C{std.core.Array}:i",
        reinterpret_cast<void *>(test_ArrayGetLength)},
    ani_native_function{"test_ArrayCreateAndSetGet", ":C{std.core.Array}",
        reinterpret_cast<void *>(test_ArrayCreateAndSetGet)},
    ani_native_function{"test_ArrayCheckIntElements", "C{std.core.Array}:z",
        reinterpret_cast<void *>(test_ArrayCheckIntElements)},
    ani_native_function{"test_ArrayPushDouble", ":C{std.core.Array}",
        reinterpret_cast<void *>(test_ArrayPushDouble)},
    ani_native_function{"test_ArrayPop", ":i",
        reinterpret_cast<void *>(test_ArrayPop)},
    ani_native_function{"test_ArrayPopEmptyIsUndefined", ":z",
        reinterpret_cast<void *>(test_ArrayPopEmptyIsUndefined)},
    ani_native_function{"test_ArrayMixedTypes", ":C{std.core.Array}",
        reinterpret_cast<void *>(test_ArrayMixedTypes)},
    ani_native_function{"test_ArrayNewWithUndefined", ":z",
        reinterpret_cast<void *>(test_ArrayNewWithUndefined)},
    ani_native_function{"test_ArrayDoublePrecisionSum", ":d",
        reinterpret_cast<void *>(test_ArrayDoublePrecisionSum)},
    ani_native_function{"test_ArrayModifyIndexOne", "C{std.core.Array}:z",
        reinterpret_cast<void *>(test_ArrayModifyIndexOne)},
    ani_native_function{"test_ArrayPushPopMixed", ":z",
        reinterpret_cast<void *>(test_ArrayPushPopMixed)},
    ani_native_function{"test_ArrayPushMany", "i:i",
        reinterpret_cast<void *>(test_ArrayPushMany)},
    ani_native_function{"test_ArrayNewInvalidLength", ":z",
        reinterpret_cast<void *>(test_ArrayNewInvalidLength)},
    ani_native_function{"test_ArrayNullAndUndefined", ":z",
        reinterpret_cast<void *>(test_ArrayNullAndUndefined)},
    ani_native_function{"test_ArrayTraverseSum", ":i",
        reinterpret_cast<void *>(test_ArrayTraverseSum)},
    ani_native_function{"test_ArrayCreateMatrix", ":C{std.core.Array}",
        reinterpret_cast<void *>(test_ArrayCreateMatrix)},
    ani_native_function{"test_ArrayCheckMatrix", "C{std.core.Array}:z",
        reinterpret_cast<void *>(test_ArrayCheckMatrix)},
};
std::array fixedArrayInstanceMethods = {
    ani_native_function{"test_FixedArrayString", ":A{C{std.core.String}}",
        reinterpret_cast<void *>(test_FixedArrayString)},
    ani_native_function{"test_CheckFixedArrayString", "A{C{std.core.String}}:z",
        reinterpret_cast<void *>(test_CheckFixedArrayString)},
    ani_native_function{"test_FixedArrayObjectRefs", ":A{C{std.core.Object}}",
        reinterpret_cast<void *>(test_FixedArrayObjectRefs)},
    ani_native_function{"test_CheckFixedArrayObjectRefs", "A{C{std.core.Object}}:z",
        reinterpret_cast<void *>(test_CheckFixedArrayObjectRefs)},
};
std::array valueArrayInstanceMethods = {
    ani_native_function{"test_ValueArrayDifferentTypes", ":z",
        reinterpret_cast<void *>(test_ValueArrayDifferentTypes)},
    ani_native_function{"test_ValueArrayTypeMismatch", ":z",
        reinterpret_cast<void *>(test_ValueArrayTypeMismatch)},
    ani_native_function{"test_ValueArrayGetPartialRegion", ":z",
        reinterpret_cast<void *>(test_ValueArrayGetPartialRegion)},
    ani_native_function{"test_ValueArraySetPartialRegion", ":z",
        reinterpret_cast<void *>(test_ValueArraySetPartialRegion)},
    ani_native_function{"test_ValueArrayRegionOutOfRange", ":z",
        reinterpret_cast<void *>(test_ValueArrayRegionOutOfRange)},
    ani_native_function{"test_ValueArrayGetSize", ":i",
        reinterpret_cast<void *>(test_ValueArrayGetSize)},
    ani_native_function{"test_ValueArrayElementAccess", ":z",
        reinterpret_cast<void *>(test_ValueArrayElementAccess)},
    ani_native_function{"test_ValueArrayLargeArray", "i:z",
        reinterpret_cast<void *>(test_ValueArrayLargeArray)},
    ani_native_function{"test_ValueArrayGetRegionNullBuffer", ":z",
        reinterpret_cast<void *>(test_ValueArrayGetRegionNullBuffer)},
    ani_native_function{"test_ValueArraySetRegionNullBuffer", ":z",
        reinterpret_cast<void *>(test_ValueArraySetRegionNullBuffer)},
    ani_native_function{"test_ValueArrayWrongRegionApi", ":z",
        reinterpret_cast<void *>(test_ValueArrayWrongRegionApi)},
    ani_native_function{"test_ValueArraySaveLocalRef", ":z",
        reinterpret_cast<void *>(test_ValueArraySaveLocalRef)},
    ani_native_function{"test_ValueArrayUseSavedLocalRef", ":z",
        reinterpret_cast<void *>(test_ValueArrayUseSavedLocalRef)},
    ani_native_function{"test_ValueArraySaveGlobalRef", ":z",
        reinterpret_cast<void *>(test_ValueArraySaveGlobalRef)},
    ani_native_function{"test_ValueArrayUseGlobalRef", ":z",
        reinterpret_cast<void *>(test_ValueArrayUseGlobalRef)},
    ani_native_function{"test_ValueArrayDeleteGlobalRef", ":z",
        reinterpret_cast<void *>(test_ValueArrayDeleteGlobalRef)},
};
std::array arrayBufferInstanceMethods = {
    ani_native_function{"test_ArrayBufferReadUint32", "C{std.core.ArrayBuffer}:i",
        reinterpret_cast<void *>(test_ArrayBufferReadUint32)},
    ani_native_function{"test_ArrayBufferModifyUint32", "C{std.core.ArrayBuffer}:",
        reinterpret_cast<void *>(test_ArrayBufferModifyUint32)},
    ani_native_function{"test_ArrayBufferGetSize", "C{std.core.ArrayBuffer}:i",
        reinterpret_cast<void *>(test_ArrayBufferGetSize)},
    ani_native_function{"test_ArrayBufferExpectBuffer", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferExpectBuffer)},
    ani_native_function{"test_ArrayBufferDetached", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferDetached)},
    ani_native_function{"test_ArrayBufferReadRawBytes", "C{std.core.ArrayBuffer}:i",
        reinterpret_cast<void *>(test_ArrayBufferReadRawBytes)},
    ani_native_function{"test_ArrayBufferModifyByte", "C{std.core.ArrayBuffer}ii:z",
        reinterpret_cast<void *>(test_ArrayBufferModifyByte)},
    ani_native_function{"test_ArrayBufferWriteWithBoundsCheck", "C{std.core.ArrayBuffer}ii:z",
        reinterpret_cast<void *>(test_ArrayBufferWriteWithBoundsCheck)},
    ani_native_function{"test_ArrayBufferZeroSize", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferZeroSize)},
    ani_native_function{"test_ArrayBufferTypedSignature", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferTypedSignature)},
    ani_native_function{"test_ArrayBufferSaveDataPointer", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferSaveDataPointer)},
    ani_native_function{"test_ArrayBufferUseSavedPointer", ":i",
        reinterpret_cast<void *>(test_ArrayBufferUseSavedPointer)},
    ani_native_function{"test_ArrayBufferCreateNative", "i:C{std.core.ArrayBuffer}",
        reinterpret_cast<void *>(test_ArrayBufferCreateNative)},
    ani_native_function{"test_ArrayBufferLargeBuffer", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferLargeBuffer)},
    ani_native_function{"test_ArrayBufferMultiThreadWrite", "C{std.core.ArrayBuffer}ii:i",
        reinterpret_cast<void *>(test_ArrayBufferMultiThreadWrite)},
    ani_native_function{"test_ArrayBufferFillBytes", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferFillBytes)},
    ani_native_function{"test_ArrayBufferModifyTypedArrayBuffer", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferModifyTypedArrayBuffer)},
    ani_native_function{"test_ArrayBufferEmptyNoCrash", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(test_ArrayBufferEmptyNoCrash)},
    ani_native_function{"test_ArrayBufferReadUnalignedUint32", "C{std.core.ArrayBuffer}:i",
        reinterpret_cast<void *>(test_ArrayBufferReadUnalignedUint32)},
};
std::array enumInstanceMethods = {
    ani_native_function{"test_EnumGetGreenIntByName", ":i",
        reinterpret_cast<void *>(test_EnumGetGreenIntByName)},
    ani_native_function{"test_EnumGetGreenIntByIndexCompare", ":z",
        reinterpret_cast<void *>(test_EnumGetGreenIntByIndexCompare)},
    ani_native_function{"test_EnumGetBlueIntIndex", ":i",
        reinterpret_cast<void *>(test_EnumGetBlueIntIndex)},
    ani_native_function{"test_EnumGetGreenIntName", ":C{std.core.String}",
        reinterpret_cast<void *>(test_EnumGetGreenIntName)},
    ani_native_function{"test_EnumGetEnumFromItem", ":z",
        reinterpret_cast<void *>(test_EnumGetEnumFromItem)},
    ani_native_function{"test_EnumGetColorStringValue", ":C{std.core.String}",
        reinterpret_cast<void *>(test_EnumGetColorStringValue)},
    ani_native_function{"test_EnumFindModuleEnum", ":i",
        reinterpret_cast<void *>(test_EnumFindModuleEnum)},
    ani_native_function{"test_EnumFindNamespaceEnum", ":i",
        reinterpret_cast<void *>(test_EnumFindNamespaceEnum)},
    ani_native_function{"test_EnumProcessIntNext",
        "E{entry.src.main.src.ets.Index.COLORINT}:"
        "E{entry.src.main.src.ets.Index.COLORINT}",
        reinterpret_cast<void *>(test_EnumProcessIntNext)},
    ani_native_function{"test_EnumReturnBlueInt", ":E{entry.src.main.src.ets.Index.COLORINT}",
        reinterpret_cast<void *>(test_EnumReturnBlueInt)},
    ani_native_function{"test_EnumFindMissingEnum", ":z",
        reinterpret_cast<void *>(test_EnumFindMissingEnum)},
    ani_native_function{"test_EnumFindMissingItem", ":z",
        reinterpret_cast<void *>(test_EnumFindMissingItem)},
    ani_native_function{"test_EnumGetItemByOutOfRangeIndex", ":z",
        reinterpret_cast<void *>(test_EnumGetItemByOutOfRangeIndex)},
    ani_native_function{"test_EnumGetLargeIntValue", ":i",
        reinterpret_cast<void *>(test_EnumGetLargeIntValue)},
    ani_native_function{"test_EnumGetUnicodeStringValue", ":C{std.core.String}",
        reinterpret_cast<void *>(test_EnumGetUnicodeStringValue)},
    ani_native_function{"test_EnumGetOtherItemFromInput",
        "E{entry.src.main.src.ets.Index.COLORINT}:"
        "E{entry.src.main.src.ets.Index.COLORINT}",
        reinterpret_cast<void *>(test_EnumGetOtherItemFromInput)},
    ani_native_function{"test_EnumFindAfterLoadLibrary", ":z",
        reinterpret_cast<void *>(test_EnumFindAfterLoadLibrary)},
    ani_native_function{"test_EnumComputeValue", "E{entry.src.main.src.ets.Index.COLORINT}:i",
        reinterpret_cast<void *>(test_EnumComputeValue)},
    ani_native_function{"test_EnumFindByDescriptorFormats", ":z",
        reinterpret_cast<void *>(test_EnumFindByDescriptorFormats)},
};
std::array errorCodeInstanceMethods = {
    ani_native_function{"test_ErrorCodeNullEnv", ":z",
        reinterpret_cast<void *>(test_ErrorCodeNullEnv)},
    ani_native_function{"test_ErrorCodePendingErrorInfo", ":z",
        reinterpret_cast<void *>(test_ErrorCodePendingErrorInfo)},
    ani_native_function{"test_ErrorCodePendingErrorPropagation", ":z",
        reinterpret_cast<void *>(test_ErrorCodePendingErrorPropagation)},
    ani_native_function{"test_ErrorCodeNormalAfterCatch", ":i",
        reinterpret_cast<void *>(test_ErrorCodeNormalAfterCatch)},
    ani_native_function{"test_ErrorCodeNotFound", ":z",
        reinterpret_cast<void *>(test_ErrorCodeNotFound)},
    ani_native_function{"test_ErrorCodeDescriptorMismatch", ":z",
        reinterpret_cast<void *>(test_ErrorCodeDescriptorMismatch)},
    ani_native_function{"test_ErrorCodeAmbiguousFindMethod", ":z",
        reinterpret_cast<void *>(test_ErrorCodeAmbiguousFindMethod)},
    ani_native_function{"test_ErrorCodeArrayOutOfRange", ":z",
        reinterpret_cast<void *>(test_ErrorCodeArrayOutOfRange)},
    ani_native_function{"test_ErrorCodeBufferTooSmall", ":z",
        reinterpret_cast<void *>(test_ErrorCodeBufferTooSmall)},
    ani_native_function{"test_ErrorCodeInvalidVersion", ":z",
        reinterpret_cast<void *>(test_ErrorCodeInvalidVersion)},
    ani_native_function{"test_ErrorCodeInvalidDescriptor", ":z",
        reinterpret_cast<void *>(test_ErrorCodeInvalidDescriptor)},
    ani_native_function{"test_ErrorCodeAlreadyBinded", ":z",
        reinterpret_cast<void *>(test_ErrorCodeAlreadyBinded)},
};
std::array faqInstanceMethods = {
    ani_native_function{"test_FaqBusinessErrorConflict", ":z",
        reinterpret_cast<void *>(test_FaqBusinessErrorConflict)},
    ani_native_function{"test_FaqDeclarationMismatch", ":z",
        reinterpret_cast<void *>(test_FaqDeclarationMismatch)},
    ani_native_function{"test_FaqBooleanPrint", ":z",
        reinterpret_cast<void *>(test_FaqBooleanPrint)},
    ani_native_function{"test_FaqBoxPrimitiveToRef", "i:z",
        reinterpret_cast<void *>(test_FaqBoxPrimitiveToRef)},
    ani_native_function{"test_FaqNativeFunctionAddressReuse", ":z",
        reinterpret_cast<void *>(test_FaqNativeFunctionAddressReuse)},
    ani_native_function{"test_FaqCompareFunctions",
        "C{std.core.Function0}C{std.core.Function0}:z",
        reinterpret_cast<void *>(test_FaqCompareFunctions)},
    ani_native_function{"test_FaqReferenceStrictEquals", ":z",
        reinterpret_cast<void *>(test_FaqReferenceStrictEquals)},
    ani_native_function{"test_FaqUtf8SubStringTruncate", ":z",
        reinterpret_cast<void *>(test_FaqUtf8SubStringTruncate)},
    ani_native_function{"test_FaqPromiseVoidResolve", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_FaqPromiseVoidResolve)},
    ani_native_function{"test_FaqNamespaceOptionalParam", "C{std.core.Int}:z",
        reinterpret_cast<void *>(test_FaqNamespaceOptionalParam)},
    ani_native_function{"test_FaqNamespaceUnionParam",
        "X{C{std.core.Double}C{std.core.String}}:z",
        reinterpret_cast<void *>(test_FaqNamespaceUnionParam)},
    ani_native_function{"test_FaqRecordKeysAmbiguous", ":z",
        reinterpret_cast<void *>(test_FaqRecordKeysAmbiguous)},
};
std::array lifecycleInstanceMethods = {
    ani_native_function{"test_LifecycleCreateGlobalObject", ":z",
        reinterpret_cast<void *>(test_LifecycleCreateGlobalObject)},
    ani_native_function{"test_LifecycleUseGlobalObject", ":i",
        reinterpret_cast<void *>(test_LifecycleUseGlobalObject)},
    ani_native_function{"test_LifecycleDeleteGlobalObject", ":z",
        reinterpret_cast<void *>(test_LifecycleDeleteGlobalObject)},
    ani_native_function{"test_LifecycleCreateLeakedGlobalRefs", "i:i",
        reinterpret_cast<void *>(test_LifecycleCreateLeakedGlobalRefs)},
    ani_native_function{"test_LifecycleNativeThreadLocalRefsWithScope", "i:z",
        reinterpret_cast<void *>(test_LifecycleNativeThreadLocalRefsWithScope)},
    ani_native_function{"test_LifecycleArkCallLocalRefsAutoManaged", "i:z",
        reinterpret_cast<void *>(test_LifecycleArkCallLocalRefsAutoManaged)},
    ani_native_function{"test_LifecycleGetVmAndGetEnv", ":z",
        reinterpret_cast<void *>(test_LifecycleGetVmAndGetEnv)},
    ani_native_function{"test_LifecycleAttachThenGetEnvSame", ":z",
        reinterpret_cast<void *>(test_LifecycleAttachThenGetEnvSame)},
    ani_native_function{"test_LifecycleGetEnvWithoutAttach", ":z",
        reinterpret_cast<void *>(test_LifecycleGetEnvWithoutAttach)},
    ani_native_function{"test_LifecycleFindAppClassInAttachedThread", ":z",
        reinterpret_cast<void *>(test_LifecycleFindAppClassInAttachedThread)},
    ani_native_function{"test_LifecycleUseCachedClassInAttachedThread", ":z",
        reinterpret_cast<void *>(test_LifecycleUseCachedClassInAttachedThread)},
    ani_native_function{"test_LifecycleAttachWithInteropOption", ":z",
        reinterpret_cast<void *>(test_LifecycleAttachWithInteropOption)},
    ani_native_function{"test_LifecycleCreateVmWithLoggerOption", ":z",
        reinterpret_cast<void *>(test_LifecycleCreateVmWithLoggerOption)},
    ani_native_function{"test_LifecycleCreateVmWithVerifyAniNoCrashOption", ":z",
        reinterpret_cast<void *>(test_LifecycleCreateVmWithVerifyAniNoCrashOption)},
    ani_native_function{"test_LifecycleCreateVmWithBootPandaFiles", ":z",
        reinterpret_cast<void *>(test_LifecycleCreateVmWithBootPandaFiles)},
    ani_native_function{"test_LifecycleAttachWithBootPandaFilesOption", ":z",
        reinterpret_cast<void *>(test_LifecycleAttachWithBootPandaFilesOption)},
    ani_native_function{"test_LifecycleNestedLocalScopes", ":z",
        reinterpret_cast<void *>(test_LifecycleNestedLocalScopes)},
};
std::array exceptionInstanceMethods = {
    ani_native_function{"test_ExceptionThrowMyError", ":",
        reinterpret_cast<void *>(test_ExceptionThrowMyError)},
    ani_native_function{"test_ExceptionClearPendingAndReturn", ":i",
        reinterpret_cast<void *>(test_ExceptionClearPendingAndReturn)},
    ani_native_function{"test_ExceptionPromiseRejectWithCatch", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_ExceptionPromiseRejectWithCatch)},
    ani_native_function{"test_ExceptionPromiseRejectWithoutCatch", ":C{std.core.Promise}",
        reinterpret_cast<void *>(test_ExceptionPromiseRejectWithoutCatch)},
    ani_native_function{"test_ExceptionBusinessErrorConflict", ":z",
        reinterpret_cast<void *>(test_ExceptionBusinessErrorConflict)},
    ani_native_function{"test_ExceptionClearThenCreateString", ":z",
        reinterpret_cast<void *>(test_ExceptionClearThenCreateString)},
    ani_native_function{"test_ExceptionNativeCatchAndAnalyze", ":C{std.core.String}",
        reinterpret_cast<void *>(test_ExceptionNativeCatchAndAnalyze)},
};
std::array stringInstanceMethods = {
    ani_native_function{"test_StringAsciiRoundTrip", ":z",
        reinterpret_cast<void *>(test_StringAsciiRoundTrip)},
    ani_native_function{"test_StringEmptyRoundTrip", ":z",
        reinterpret_cast<void *>(test_StringEmptyRoundTrip)},
    ani_native_function{"test_StringUtf8RoundTrip", ":z",
        reinterpret_cast<void *>(test_StringUtf8RoundTrip)},
    ani_native_function{"test_StringUtf8Size", ":i",
        reinterpret_cast<void *>(test_StringUtf8Size)},
    ani_native_function{"test_StringInvalidUtf8NoCrash", ":z",
        reinterpret_cast<void *>(test_StringInvalidUtf8NoCrash)},
    ani_native_function{"test_StringLongStringRoundTrip", "i:z",
        reinterpret_cast<void *>(test_StringLongStringRoundTrip)},
    ani_native_function{"test_StringReadTwice", "C{std.core.String}:z",
        reinterpret_cast<void *>(test_StringReadTwice)},
    ani_native_function{"test_StringSmallBuffer", ":z",
        reinterpret_cast<void *>(test_StringSmallBuffer)},
    ani_native_function{"test_StringLocalScopeRecycle", "i:z",
        reinterpret_cast<void *>(test_StringLocalScopeRecycle)},
    ani_native_function{"test_StringSaveGlobalRef", ":z",
        reinterpret_cast<void *>(test_StringSaveGlobalRef)},
    ani_native_function{"test_StringUseGlobalRef", ":C{std.core.String}",
        reinterpret_cast<void *>(test_StringUseGlobalRef)},
    ani_native_function{"test_StringDeleteGlobalRef", ":z",
        reinterpret_cast<void *>(test_StringDeleteGlobalRef)},
};
std::array optInstanceMethods = {
    ani_native_function{"test_OptDefaultCreateString", "C{std.core.String}:C{std.core.String}",
        reinterpret_cast<void *>(test_OptDefaultCreateString)},
    ani_native_function{"test_OptQuickSleep", "i:i",
        reinterpret_cast<void *>(test_OptQuickSleep)},
    ani_native_function{"test_OptQuickWithString", "C{std.core.String}:i",
        reinterpret_cast<void *>(test_OptQuickWithString)},
    ani_native_function{"test_OptQuickStartThread", ":z",
        reinterpret_cast<void *>(test_OptQuickStartThread)},
    ani_native_function{"test_OptDefaultAdd", "ii:i",
        reinterpret_cast<void *>(test_OptDefaultAdd)},
    ani_native_function{"test_OptQuickCreateTempString", "C{std.core.String}:i",
        reinterpret_cast<void *>(test_OptQuickCreateTempString)},
};
std::array optNamespaceMethods = {
    ani_native_function{"test_OptNamespaceQuickAdd", "ii:i",
        reinterpret_cast<void *>(test_OptNamespaceQuickAdd)},
};

std::array methods = {
    ani_native_function{"testAniArrayDouble", "C{std.core.Array}:C{std.core.Array}",
        reinterpret_cast<void *>(testAniArrayDouble)},
    ani_native_function{"testAniMatrixTranspose", "C{std.core.ArrayBuffer}ii:C{std.core.ArrayBuffer}",
        reinterpret_cast<void *>(testAniMatrixTranspose)},
    ani_native_function{"testAniXorEncrypt", "C{std.core.ArrayBuffer}:z",
        reinterpret_cast<void *>(testAniXorEncrypt)},
    ani_native_function{"testAniFileCopy", "C{std.core.String}C{std.core.String}l:z",
        reinterpret_cast<void *>(testAniFileCopy)},
    ani_native_function{"testAniSysInfo", ":C{std.core.Object}",
        reinterpret_cast<void *>(testAniSysInfo)},
    ani_native_function{"testAniCreatePhysics", "d:l",
        reinterpret_cast<void *>(testAniCreatePhysics)},
    ani_native_function{"testAniStepPhysics", "ld:d",
        reinterpret_cast<void *>(testAniStepPhysics)},
    ani_native_function{"testAniDestroyPhysics", "l:",
        reinterpret_cast<void *>(TestAniDestroyPhysics)},
    ani_native_function{"testAniFeatureExtract", "C{std.core.Array}:C{std.core.Object}",
        reinterpret_cast<void *>(testAniFeatureExtract)},
    ani_native_function{"testAniErrorTrigger", ":z",
        reinterpret_cast<void *>(testAniErrorTrigger)},
    ani_native_function{"testAniParallelSum", "i:C{std.core.Object}",
        reinterpret_cast<void *>(testAniParallelSum)},
    ani_native_function{"testAniAsyncCompute", "C{std.core.Function}:z",
        reinterpret_cast<void *>(testAniAsyncCompute)},
    ani_native_function{"testAniCachedLookup", ":z",
        reinterpret_cast<void *>(testAniCachedLookup)},
    };

std::array moduleFns = {
    ani_native_function{"testAniDynamicRegistration", ":z",
        reinterpret_cast<void *>(testAniDynamicRegistration)},
    ani_native_function{"dynAdd", "ii:i",
        reinterpret_cast<void *>(DynAdd)},
    ani_native_function{"dynSub", "ii:i",
        reinterpret_cast<void *>(DynSub)},
    };
}
static ani_status BindInstanceMethods(ani_env *env, ani_class cls,
    const ani_native_function *methods, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        ani_status status = env->Class_BindNativeMethods(cls, &methods[i], 1);
        if (!AssertEqMsg(status, ANI_OK, "Bind instance native method failed")) {
            return status;
        }
        std::cout << "Bind instance native method success, name: "
                  << methods[i].name << std::endl;
    }
    return ANI_OK;
}
static ani_status BindStaticMethods(ani_env *env, ani_class cls,
    const ani_native_function *methods, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        ani_status status = env->Class_BindStaticNativeMethods(cls, &methods[i], 1);
        if (!AssertEqMsg(status, ANI_OK, "Bind static native method failed")) {
        return status;
    }
        std::cout << "Bind static native method success, name: "
                  << methods[i].name << std::endl;
    }
    return ANI_OK;
}
static ani_status BindModuleMethods(ani_env *env, ani_module module,
    const ani_native_function *methods, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        ani_status status = env->Module_BindNativeFunctions(module, &methods[i], 1);
        if (!AssertEqMsg(status, ANI_OK, "Bind module native function failed")) {
        return status;
    }
        std::cout << "Bind module native function success, name: "
                  << methods[i].name << std::endl;
    }
    return ANI_OK;
}
static ani_status BindExpectedFailureModuleMethods(ani_env *env, ani_module module,
    const ani_native_function *methods, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        ani_status status = env->Module_BindNativeFunctions(module, &methods[i], 1);
        std::cout << "Negative module native function was bound, name: "
                  << methods[i].name << ", signature: "
                  << methods[i].signature << std::endl;
    }
    return ANI_OK;
}
static ani_status BindNamespaceMethods(ani_env *env, ani_namespace ns,
    const ani_native_function *methods, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        ani_status status = env->Namespace_BindNativeFunctions(ns, &methods[i], 1);
        if (!AssertEqMsg(status, ANI_OK, "Bind namespace native function failed")) {
        return status;
    }
        std::cout << "Bind namespace native function success, name: "
                  << methods[i].name << std::endl;
    }
    return ANI_OK;
}
static ani_status FindBindTargets(ani_env *env, const char *clsName,
    ani_class *cls, ani_module *module, ani_namespace *ns)
{
    ani_status status = env->FindClass(clsName, cls);
    if (!AssertEqMsg(status, ANI_OK, "Not found class")) {
        return static_cast<ani_status>(ANI_RES_INVALID_ARGS);
    }
    status = env->FindModule(MODULE_NAME, module);
    if (!AssertEqMsg(status, ANI_OK, "Not found module")) {
        return static_cast<ani_status>(ANI_RES_INVALID_ARGS);
    }
    status = env->FindNamespace(NAMESPACE_NAME, ns);
    if (!AssertEqMsg(status, ANI_OK, "Not found namespace")) {
        return static_cast<ani_status>(ANI_RES_INVALID_ARGS);
    }
    return ANI_OK;
}
static ani_status BindCommonCases(ani_env *env, ani_class cls, ani_module module, ani_namespace ns)
{
    ani_status status = BindInstanceMethods(env, cls, bindInstanceMethods.data(), bindInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind bindInstanceMethods failed")) {
        return status;
    }
    status = BindStaticMethods(env, cls, bindStaticMethods.data(), bindStaticMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind bindStaticMethods failed")) {
        return status;
    }
    status = BindNamespaceMethods(env, ns, bindNamespaceMethods.data(), bindNamespaceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind bindNamespaceMethods failed")) {
        return status;
    }
    status = BindModuleMethods(env, module, bindModuleMethods.data(), bindModuleMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind bindModuleMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindManglingTypeParamCreateCases(ani_env *env, ani_class cls)
{
    ani_status status = BindInstanceMethods(env, cls, manglingInstanceMethods.data(), manglingInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind manglingInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, typeInstanceMethods.data(), typeInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind typeInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, paramInstanceMethods.data(), paramInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind paramInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, createInstanceMethods.data(), createInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind createInstanceMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindIfaceFuncAsyncMtCases(ani_env *env, ani_class cls)
{
    ani_status status = BindInstanceMethods(env, cls, ifaceInstanceMethods.data(), ifaceInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind ifaceInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, funcInstanceMethods.data(), funcInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind funcInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, asyncInstanceMethods.data(), asyncInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind asyncInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, mtInstanceMethods.data(), mtInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind mtInstanceMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindArrayAndEnumCases(ani_env *env, ani_class cls)
{
    ani_status status = BindInstanceMethods(env, cls, arrayInstanceMethods.data(), arrayInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind arrayInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, fixedArrayInstanceMethods.data(), fixedArrayInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind fixedArrayInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, valueArrayInstanceMethods.data(), valueArrayInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind valueArrayInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, arrayBufferInstanceMethods.data(), arrayBufferInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind arrayBufferInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, enumInstanceMethods.data(), enumInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind enumInstanceMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindErrorCodeAndFaqCases(ani_env *env, ani_class cls)
{
    ani_status status = BindInstanceMethods(env, cls, errorCodeInstanceMethods.data(), errorCodeInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind errorCodeInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, faqInstanceMethods.data(), faqInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind faqInstanceMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindDisabledBigIntAndContainerCases(ani_env *env, ani_class cls)
{
    (void)env;
    (void)cls;
    return ANI_OK;
}
static ani_status BindLifecycleExceptionStringOptCases(ani_env *env, ani_class cls)
{
    ani_status status = BindInstanceMethods(env, cls, lifecycleInstanceMethods.data(), lifecycleInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind lifecycleInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, exceptionInstanceMethods.data(), exceptionInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind exceptionInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, stringInstanceMethods.data(), stringInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind stringInstanceMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, optInstanceMethods.data(), optInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind optInstanceMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindDisabledOptStaticAndModuleCases(ani_env *env, ani_class cls, ani_module module)
{
    (void)env;
    (void)cls;
    (void)module;
    return ANI_OK;
}
static ani_status BindOptNamespaceCases(ani_env *env)
{
    ani_namespace optNs {};
    ani_status status = env->FindNamespace("entry.src.main.src.ets.Index.OptNamespace", &optNs);
    if (!AssertEqMsg(status, ANI_OK, "Not found namespace 'entry.src.main.src.ets.Index.OptNamespace'")) {
        return static_cast<ani_status>(ANI_RES_INVALID_ARGS);
    }
    return BindNamespaceMethods(env, optNs, optNamespaceMethods.data(), optNamespaceMethods.size());
}
static ani_status BindLoadLibErrorAndDisasmCases(ani_env *env, ani_class cls, ani_module module)
{
    ani_status status = BindModuleMethods(env, module, loadLibModuleMethods.data(), loadLibModuleMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind loadLibModuleMethods failed")) {
        return status;
    }
    status = BindModuleMethods(env, module, errorModuleMethods.data(), errorModuleMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind errorModuleMethods failed")) {
        return status;
    }
    status = BindExpectedFailureModuleMethods(env, module,
        errorExpectedFailureModuleMethods.data(), errorExpectedFailureModuleMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind errorExpectedFailureModuleMethods failed")) {
        return status;
    }
    status = BindInstanceMethods(env, cls, disasmInstanceMethods.data(), disasmInstanceMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind disasmInstanceMethods failed")) {
        return status;
    }
    status = BindStaticMethods(env, cls, disasmStaticMethods.data(), disasmStaticMethods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind disasmStaticMethods failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindScenarioCases(ani_env *env, ani_class cls)
{
    ani_status status = BindInstanceMethods(env, cls, methods.data(), methods.size());
    if (!AssertEqMsg(status, ANI_OK, "Bind methods failed")) {
        return status;
    }
    status = BindManglingTypeParamCreateCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindManglingTypeParamCreateCases failed")) {
        return status;
    }
    status = BindIfaceFuncAsyncMtCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindIfaceFuncAsyncMtCases failed")) {
        return status;
    }
    status = BindArrayAndEnumCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindArrayAndEnumCases failed")) {
        return status;
    }
    status = BindErrorCodeAndFaqCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindErrorCodeAndFaqCases failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status BindRemainingCases(ani_env *env, ani_class cls, ani_module module)
{
    ani_status status = BindDisabledBigIntAndContainerCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindDisabledBigIntAndContainerCases failed")) {
        return status;
    }
    status = BindLifecycleExceptionStringOptCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindLifecycleExceptionStringOptCases failed")) {
        return status;
    }
    status = BindDisabledOptStaticAndModuleCases(env, cls, module);
    if (!AssertEqMsg(status, ANI_OK, "BindDisabledOptStaticAndModuleCases failed")) {
        return status;
    }
    status = BindOptNamespaceCases(env);
    if (!AssertEqMsg(status, ANI_OK, "BindOptNamespaceCases failed")) {
        return status;
    }
    status = BindLoadLibErrorAndDisasmCases(env, cls, module);
    if (!AssertEqMsg(status, ANI_OK, "BindLoadLibErrorAndDisasmCases failed")) {
        return status;
    }
    return ANI_OK;
}
static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env = nullptr;
    ani_status status = vm->GetEnv(ANI_VERSION_1, &env);
    if (!AssertEqMsg(status, ANI_OK, "Unsupported ANI_VERSION_1")) {
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    ani_class cls {};
    ani_module module {};
    ani_namespace ns {};
    status = FindBindTargets(env, clsName, &cls, &module, &ns);
    if (!AssertEqMsg(status, ANI_OK, "FindBindTargets failed")) {
        return status;
    }
    status = BindCommonCases(env, cls, module, ns);
    if (!AssertEqMsg(status, ANI_OK, "BindCommonCases failed")) {
        return status;
    }
    status = BindScenarioCases(env, cls);
    if (!AssertEqMsg(status, ANI_OK, "BindScenarioCases failed")) {
        return status;
    }
    status = BindRemainingCases(env, cls, module);
    if (!AssertEqMsg(status, ANI_OK, "BindRemainingCases failed")) {
        return status;
    }
    return ANI_OK;
}

static ani_status bindModuleFunctions(ani_vm *vm)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return (ani_status)ANI_RES_OUT_OF_REF;
    }

    ani_module module = nullptr;
    if (ANI_OK != env->FindModule(NATIVE_BINDINGS_MODULE, &module)) {
        std::cerr << "Not found module '" << NATIVE_BINDINGS_MODULE << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_ARGS;
    }

    if (ANI_OK != env->Module_BindNativeFunctions(module, moduleFns.data(), moduleFns.size())) {
        std::cerr << "Cannot bind module functions" << std::endl;
        return (ani_status)ANI_RES_INVALID_TYPE;
    }
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    ani_status status = bindCase(vm, "entry.src.main.src.ets.Index.Foo");
    bindModuleFunctions(vm);
    if (!AssertEqMsg(status, ANI_OK, "bindCase failed")) {
        return status;
    }
    *result = ANI_VERSION_1;
    return ANI_OK;
}
void AniTestLog(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    OH_LOG_VPrint(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, fmt, args);
    va_end(args);
}

ani_boolean FindClassByName(ani_env *env, const char *className, ani_class *outCls)
{
    if (env == nullptr || className == nullptr || outCls == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->FindClass(className, outCls);
    if (status != ANI_OK || (*outCls) == nullptr) {
        AniTestLog("FindClass failed for %s", className);
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean FindClassFallback(ani_env *env, const char *shortName, ani_class *out)
{
    static const char *const prefixes[] = {"", "std.core.", "std.concurrency.", ETS_INDEX_PREFIX};
    for (ani_int round = 0; round < FIND_CLASS_RETRY_ROUNDS; ++round) {
        for (const char *prefix : prefixes) {
            std::string full = std::string(prefix) + shortName;
            if (env->FindClass(full.c_str(), out) == ANI_OK) {
                return ANI_TRUE;
            }
            env->ResetError();
        }
        if (round < FIND_CLASS_RETRY_ROUNDS - 1) {
            std::this_thread::sleep_for(std::chrono::milliseconds(FIND_CLASS_RETRY_INTERVAL_MS));
        }
    }
    AniTestLog("FindClassFallback: FAIL '%s' after retries", shortName);
    return ANI_FALSE;
}

ani_object CreateNativeResource(ani_env *env, ani_int value)
{
    ani_class resourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &resourceCls) != ANI_TRUE) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    if (env->Class_FindMethod(resourceCls, "<ctor>", ":", &ctor) != ANI_OK) {
        env->ResetError();
        return nullptr;
    }
    ani_object resource = nullptr;
    if (env->Object_New(resourceCls, ctor, &resource) != ANI_OK) {
        env->ResetError();
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Int(resource, "value", value) != ANI_OK) {
        env->ResetError();
        return nullptr;
    }
    return resource;
}

constexpr ani_size MAX_MATCHED_METHODS = 256;

void BindClassMethods(ani_env *env, const char *clsName, const ani_native_function *methods,
                      ani_size count, const char *tag)
{
    ani_class cls = nullptr;
    if (env->FindClass(clsName, &cls) != ANI_OK) {
        AniTestLog("%s: not found '%s'", tag, clsName);
        return;
    }
    ani_native_function matched[MAX_MATCHED_METHODS];
    ani_size matchedCount = 0;
    for (ani_size idx = 0; idx < count && matchedCount < MAX_MATCHED_METHODS; ++idx) {
        ani_method probe = nullptr;
        if (env->Class_FindMethod(cls, methods[idx].name, methods[idx].signature, &probe) == ANI_OK) {
            matched[matchedCount++] = methods[idx];
        }
    }
    if (matchedCount == 0) {
        AniTestLog("%s: no matched methods for '%s'", tag, clsName);
        return;
    }
    if (env->Class_BindNativeMethods(cls, matched, matchedCount) != ANI_OK) {
        AniTestLog("%s: bind failed '%s' (%u methods)", tag, clsName,
                   static_cast<uint32_t>(matchedCount));
    }
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    AniTestLog("entering libentry.so's ANI_Constructor");

    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ANI_Constructor: unsupported ANI_VERSION_1");
        *result = ANI_VERSION_1;
        return ANI_OK;
    }

    AniTestLog("BindClassStorageTest status: %d", BindClassStorageTest(vm));
    AniTestLog("BindContainerStorageTest status: %d", BindContainerStorageTest(vm));
    AniTestLog("BindThreadSafeStorageTest status: %d", BindThreadSafeStorageTest(vm));
    AniTestLog("BindAniObjectTypeTest status: %d", BindAniObjectTypeTest(vm));
    AniTestLog("BindConcurrentStorageTest status: %d", BindConcurrentStorageTest(vm));
    AniTestLog("BindMapKeyStorageTest status: %d", BindMapKeyStorageTest(vm));
    AniTestLog("BindExceptionStorageTest status: %d", BindExceptionStorageTest(vm));

    *result = ANI_VERSION_1;
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Destructor(ani_vm *vm, uint32_t *result)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) == ANI_OK && env != nullptr) {
        CleanupThreadSafeStorageTest(env);
        CleanupConcurrentStorageTest(env);
        CleanupClassStorageTest(env);
        CleanupMapKeyStorageTest(env);
        CleanupAniObjectTypeTest(env);
        CleanupExceptionStorageTest(env);
        CleanupContainerStorageTest(env);
    }
    *result = 0;
    return ANI_OK;
}

