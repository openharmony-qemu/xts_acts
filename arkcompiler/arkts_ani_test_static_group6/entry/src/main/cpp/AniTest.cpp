/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "Common.h"
#include "VersionInfo.h"
#include "AttachDetachTest.h"
#include "BoxUnBoxPrimitive.h"
#include "ClassOperationsTest.h"
#include "EnumOperationsTest.h"
#include "FieldAccessTest.h"
#include "GenericClassTest.h"
#include "MethodCallTest.h"
#include "MethodOverloadTest.h"
#include "PropertyAccessTest.h"

namespace {
    std::array methods = {
        // --- AttachDetach tests ---
        ani_native_function{"test_GetVersion", ":i", reinterpret_cast<void *>(test_GetVersion)},
        ani_native_function{"test_AttachDetach", ":i", reinterpret_cast<void *>(test_AttachDetach)},
        ani_native_function{"test_AttachDetach_WithInterop", ":i", reinterpret_cast<void *>(test_AttachDetach_WithInterop)},
        ani_native_function{"test_Attach_InvalidResult", ":i", reinterpret_cast<void *>(test_Attach_InvalidResult)},
        ani_native_function{"test_Attach_InvalidVersion", ":i", reinterpret_cast<void *>(test_Attach_InvalidVersion)},
        ani_native_function{"test_Attach_InvalidOption", ":i", reinterpret_cast<void *>(test_Attach_InvalidOption)},
        ani_native_function{"test_Attach_RepeatAttach", ":i", reinterpret_cast<void *>(test_Attach_RepeatAttach)},
        ani_native_function{"test_Attach_RepeatDetach", ":i", reinterpret_cast<void *>(test_Attach_RepeatDetach)},
        ani_native_function{"test_Detach_WithoutAttach", ":i", reinterpret_cast<void *>(test_Detach_WithoutAttach)},
        ani_native_function{"test_ConcurrentAttach", ":i", reinterpret_cast<void *>(test_ConcurrentAttach)},
        ani_native_function{"test_ConcurrentMainThreadWorker", ":i",
                            reinterpret_cast<void *>(test_ConcurrentMainThreadWorker)},
        ani_native_function{"test_CreateObjectInWorker", ":i", reinterpret_cast<void *>(test_CreateObjectInWorker)},
        ani_native_function{"test_Attach_DetachThenGetEnvAndReattach", ":i",
                            reinterpret_cast<void *>(test_Attach_DetachThenGetEnvAndReattach)},
        ani_native_function{"test_Attach_InvalidHighVersion", ":i",
                            reinterpret_cast<void *>(test_Attach_InvalidHighVersion)},
        ani_native_function{"test_Attach_DisableInterop", ":i", reinterpret_cast<void *>(test_Attach_DisableInterop)},
        ani_native_function{"test_Attach_FailedAttachStateRecovery", ":i",
                            reinterpret_cast<void *>(test_Attach_FailedAttachStateRecovery)},
        ani_native_function{"test_Attach_CurrentManagedThreadShouldFail", ":i",
                            reinterpret_cast<void *>(test_Attach_CurrentManagedThreadShouldFail)},
        ani_native_function{"test_ConcurrentMainThreadWorkerOverlap", ":i",
                            reinterpret_cast<void *>(test_ConcurrentMainThreadWorkerOverlap)},
        ani_native_function{"test_Attach_LocalScopeStress", ":i", reinterpret_cast<void *>(test_Attach_LocalScopeStress)},

        ani_native_function{"testBoxBooleanNative", ":z",
            reinterpret_cast<void *>(testBoxBooleanNative)},
        ani_native_function{"testUnboxBooleanNative", ":z",
            reinterpret_cast<void *>(testUnboxBooleanNative)},
        ani_native_function{"testUnboxBooleanExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxBooleanExceptionNative)},
        ani_native_function{"testBoxByteNative", ":z",
            reinterpret_cast<void *>(testBoxByteNative)},
        ani_native_function{"testBoxByteExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxByteExceptionNative)},
        ani_native_function{"testUnboxByteNative", ":z",
            reinterpret_cast<void *>(testUnboxByteNative)},
        ani_native_function{"testBoxCharNative", ":z",
            reinterpret_cast<void *>(testBoxCharNative)},
        ani_native_function{"testBoxCharExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxCharExceptionNative)},
        ani_native_function{"testUnboxCharNative", ":z",
            reinterpret_cast<void *>(testUnboxCharNative)},
        ani_native_function{"testUnboxCharExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxCharExceptionNative)},
        ani_native_function{"testBoxDoubleNative", ":z",
            reinterpret_cast<void *>(testBoxDoubleNative)},
        ani_native_function{"testBoxDoubleExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxDoubleExceptionNative)},
        ani_native_function{"testUnboxDoubleNative", ":z",
            reinterpret_cast<void *>(testUnboxDoubleNative)},
        ani_native_function{"testUnboxDoubleExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxDoubleExceptionNative)},
        ani_native_function{"testBoxFloatNative", ":z",
            reinterpret_cast<void *>(testBoxFloatNative)},
        ani_native_function{"testBoxFloatExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxFloatExceptionNative)},
        ani_native_function{"testUnboxFloatNative", ":z",
            reinterpret_cast<void *>(testUnboxFloatNative)},
        ani_native_function{"testUnboxFloatExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxFloatExceptionNative)},
        ani_native_function{"testBoxIntNative", ":z",
            reinterpret_cast<void *>(testBoxIntNative)},
        ani_native_function{"testBoxIntExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxIntExceptionNative)},
        ani_native_function{"testUnboxIntNative", ":z",
            reinterpret_cast<void *>(testUnboxIntNative)},
        ani_native_function{"testUnboxIntExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxIntExceptionNative)},
        ani_native_function{"testBoxLongNative", ":z",
            reinterpret_cast<void *>(testBoxLongNative)},
        ani_native_function{"testBoxLongExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxLongExceptionNative)},
        ani_native_function{"testUnboxLongNative", ":z",
            reinterpret_cast<void *>(testUnboxLongNative)},
        ani_native_function{"testUnboxLongExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxLongExceptionNative)},
        ani_native_function{"testBoxShortNative", ":z",
            reinterpret_cast<void *>(testBoxShortNative)},
        ani_native_function{"testBoxShortExceptionNative", ":z",
            reinterpret_cast<void *>(testBoxShortExceptionNative)},
        ani_native_function{"testUnboxShortNative", ":z",
            reinterpret_cast<void *>(testUnboxShortNative)},
        ani_native_function{"testUnboxShortExceptionNative", ":z",
            reinterpret_cast<void *>(testUnboxShortExceptionNative)},
        ani_native_function{"testStabilityLoop1000NormalNative", ":z",
            reinterpret_cast<void *>(testStabilityLoop1000NormalNative)},
        ani_native_function{"testStabilityLoop1000ExceptionNative", ":z",
            reinterpret_cast<void *>(testStabilityLoop1000ExceptionNative)},
        ani_native_function{"testStability10ThreadsNormalNative", ":z",
            reinterpret_cast<void *>(testStability10ThreadsNormalNative)},
        ani_native_function{"testStability10ThreadsExceptionNative", ":z",
            reinterpret_cast<void *>(testStability10ThreadsExceptionNative)},
        
        // --- Group 1: ClassOperations ---
        ani_native_function{"test_FindClass_RegularClass", ":i", reinterpret_cast<void *>(test_FindClass_RegularClass)},
        ani_native_function{"test_FindClass_ExportedClass", ":i", reinterpret_cast<void *>(test_FindClass_ExportedClass)},
        ani_native_function{"test_FindClass_FinalClass", ":i", reinterpret_cast<void *>(test_FindClass_FinalClass)},
        ani_native_function{"test_FindClass_AbstractClass", ":i", reinterpret_cast<void *>(test_FindClass_AbstractClass)},
        ani_native_function{"test_FindClass_Interface", ":i", reinterpret_cast<void *>(test_FindClass_Interface)},
        ani_native_function{"test_FindClass_Enum", ":i", reinterpret_cast<void *>(test_FindClass_Enum)},
        ani_native_function{"test_FindClass_NotExist", ":i", reinterpret_cast<void *>(test_FindClass_NotExist)},
        ani_native_function{"test_ObjectNew_RegularClass", ":i", reinterpret_cast<void *>(test_ObjectNew_RegularClass)},
        ani_native_function{"test_ObjectNew_DefaultConstructor", ":i", reinterpret_cast<void *>(test_ObjectNew_DefaultConstructor)},
        ani_native_function{"test_ObjectNew_AbstractClass_Fail", ":i", reinterpret_cast<void *>(test_ObjectNew_AbstractClass_Fail)},
        ani_native_function{"test_ObjectNew_Interface_Fail", ":i", reinterpret_cast<void *>(test_ObjectNew_Interface_Fail)},
        ani_native_function{"test_ObjectNew_OverloadedConstructor", ":i", reinterpret_cast<void *>(test_ObjectNew_OverloadedConstructor)},
        ani_native_function{"test_ObjectNew_ConcreteFromAbstract", ":i", reinterpret_cast<void *>(test_ObjectNew_ConcreteFromAbstract)},
        ani_native_function{"test_ObjectNew_ImplementsOne", ":i", reinterpret_cast<void *>(test_ObjectNew_ImplementsOne)},
        ani_native_function{"test_ObjectNew_ImplementsMany", ":i", reinterpret_cast<void *>(test_ObjectNew_ImplementsMany)},
        ani_native_function{"test_ObjectInstanceOf_Class", ":i", reinterpret_cast<void *>(test_ObjectInstanceOf_Class)},
        ani_native_function{"test_ObjectInstanceOf_Interface", ":i", reinterpret_cast<void *>(test_ObjectInstanceOf_Interface)},
        ani_native_function{"test_ObjectInstanceOf_NotRelated", ":i", reinterpret_cast<void *>(test_ObjectInstanceOf_NotRelated)},
        // --- Group 2: FieldAccess ---
        ani_native_function{"test_GetField_Int", ":i", reinterpret_cast<void *>(test_GetField_Int)},
        ani_native_function{"test_SetField_Int", ":i", reinterpret_cast<void *>(test_SetField_Int)},
        ani_native_function{"test_GetField_String", ":i", reinterpret_cast<void *>(test_GetField_String)},
        ani_native_function{"test_SetField_String", ":i", reinterpret_cast<void *>(test_SetField_String)},
        ani_native_function{"test_GetField_ReadOnly", ":i", reinterpret_cast<void *>(test_GetField_ReadOnly)},
        ani_native_function{"test_GetField_Boolean", ":i", reinterpret_cast<void *>(test_GetField_Boolean)},
        ani_native_function{"test_GetField_Double", ":i", reinterpret_cast<void *>(test_GetField_Double)},
        ani_native_function{"test_GetField_Float", ":i", reinterpret_cast<void *>(test_GetField_Float)},
        ani_native_function{"test_GetField_Long", ":i", reinterpret_cast<void *>(test_GetField_Long)},
        ani_native_function{"test_GetField_Byte", ":i", reinterpret_cast<void *>(test_GetField_Byte)},
        ani_native_function{"test_GetField_Short", ":i", reinterpret_cast<void *>(test_GetField_Short)},
        ani_native_function{"test_GetField_Char", ":i", reinterpret_cast<void *>(test_GetField_Char)},
        ani_native_function{"test_GetField_Static", ":i", reinterpret_cast<void *>(test_GetField_Static)},
        ani_native_function{"test_SetField_Static", ":i", reinterpret_cast<void *>(test_SetField_Static)},
        ani_native_function{"test_GetField_Private", ":i", reinterpret_cast<void *>(test_GetField_Private)},
        ani_native_function{"test_GetField_ReferenceType", ":i", reinterpret_cast<void *>(test_GetField_ReferenceType)},
        ani_native_function{"test_GetField_EnumType", ":i", reinterpret_cast<void *>(test_GetField_EnumType)},
        // --- Group 3: PropertyAccess ---
        ani_native_function{"test_GetProperty_InterfaceField", ":i", reinterpret_cast<void *>(test_GetProperty_InterfaceField)},
        ani_native_function{"test_SetProperty_InterfaceField", ":i", reinterpret_cast<void *>(test_SetProperty_InterfaceField)},
        ani_native_function{"test_GetProperty_InterfaceInt", ":i", reinterpret_cast<void *>(test_GetProperty_InterfaceInt)},
        ani_native_function{"test_SetProperty_InterfaceInt", ":i", reinterpret_cast<void *>(test_SetProperty_InterfaceInt)},
        ani_native_function{"test_GetProperty_Accessor", ":i", reinterpret_cast<void *>(test_GetProperty_Accessor)},
        ani_native_function{"test_SetProperty_Accessor", ":i", reinterpret_cast<void *>(test_SetProperty_Accessor)},
        ani_native_function{"test_GetProperty_ReadOnly", ":i", reinterpret_cast<void *>(test_GetProperty_ReadOnly)},
        ani_native_function{"test_PropertyVsField_Distinction", ":i", reinterpret_cast<void *>(test_PropertyVsField_Distinction)},
        ani_native_function{"test_GetProperty_MultiInterface", ":i", reinterpret_cast<void *>(test_GetProperty_MultiInterface)},
        ani_native_function{"test_GetStaticProperty_Accessor", ":i", reinterpret_cast<void *>(test_GetStaticProperty_Accessor)},
        // --- Group 4: MethodCall ---
        ani_native_function{"test_CallMethod_Instance", ":i", reinterpret_cast<void *>(test_CallMethod_Instance)},
        ani_native_function{"test_CallMethod_ReturnInt", ":i", reinterpret_cast<void *>(test_CallMethod_ReturnInt)},
        ani_native_function{"test_CallMethod_Static", ":i", reinterpret_cast<void *>(test_CallMethod_Static)},
        ani_native_function{"test_CallMethod_Override", ":i", reinterpret_cast<void *>(test_CallMethod_Override)},
        ani_native_function{"test_CallMethod_SelfReturn", ":i", reinterpret_cast<void *>(test_CallMethod_SelfReturn)},
        ani_native_function{"test_CallMethodByName_Instance", ":i", reinterpret_cast<void *>(test_CallMethodByName_Instance)},
        ani_native_function{"test_CallMethodByName_Static", ":i", reinterpret_cast<void *>(test_CallMethodByName_Static)},
        ani_native_function{"test_CallMethod_Final", ":i", reinterpret_cast<void *>(test_CallMethod_Final)},
        ani_native_function{"test_CallMethod_AbstractViaConcrete", ":i", reinterpret_cast<void *>(test_CallMethod_AbstractViaConcrete)},
        ani_native_function{"test_CallMethod_VoidReturn", ":i", reinterpret_cast<void *>(test_CallMethod_VoidReturn)},
        ani_native_function{"test_CallMethod_MultipleParams", ":i", reinterpret_cast<void *>(test_CallMethod_MultipleParams)},
        // --- Group 5: MethodOverload ---
        ani_native_function{"test_ImplicitOverload_Int", ":i", reinterpret_cast<void *>(test_ImplicitOverload_Int)},
        ani_native_function{"test_ImplicitOverload_String", ":i", reinterpret_cast<void *>(test_ImplicitOverload_String)},
        ani_native_function{"test_ImplicitOverload_Ambiguous", ":i", reinterpret_cast<void *>(test_ImplicitOverload_Ambiguous)},
        ani_native_function{"test_ExplicitOverload_Int", ":i", reinterpret_cast<void *>(test_ExplicitOverload_Int)},
        ani_native_function{"test_ExplicitOverload_String", ":i", reinterpret_cast<void *>(test_ExplicitOverload_String)},
        ani_native_function{"test_StaticOverload_Int", ":i", reinterpret_cast<void *>(test_StaticOverload_Int)},
        ani_native_function{"test_StaticOverload_String", ":i", reinterpret_cast<void *>(test_StaticOverload_String)},
        ani_native_function{"test_ConstructorOverload_Default", ":i", reinterpret_cast<void *>(test_ConstructorOverload_Default)},
        ani_native_function{"test_ConstructorOverload_WithParams", ":i", reinterpret_cast<void *>(test_ConstructorOverload_WithParams)},
        // --- Group 6: EnumOperations ---
        ani_native_function{"test_FindEnum", ":i", reinterpret_cast<void *>(test_FindEnum)},
        ani_native_function{"test_GetEnumItemByName", ":i", reinterpret_cast<void *>(test_GetEnumItemByName)},
        ani_native_function{"test_EnumItemGetValue", ":i", reinterpret_cast<void *>(test_EnumItemGetValue)},
        ani_native_function{"test_EnumItemGetName", ":i", reinterpret_cast<void *>(test_EnumItemGetName)},
        ani_native_function{"test_EnumFieldAccess", ":i", reinterpret_cast<void *>(test_EnumFieldAccess)},
        // --- Group 7: GenericClass ---
        ani_native_function{"test_FindClass_Generic", ":i", reinterpret_cast<void *>(test_FindClass_Generic)},
        ani_native_function{"test_ObjectNew_GenericString", ":i", reinterpret_cast<void *>(test_ObjectNew_GenericString)},
        ani_native_function{"test_GetField_Generic", ":i", reinterpret_cast<void *>(test_GetField_Generic)},
        ani_native_function{"test_CallMethod_GenericReturn", ":i", reinterpret_cast<void *>(test_CallMethod_GenericReturn)},
        ani_native_function{"test_GenericDerived", ":i", reinterpret_cast<void *>(test_GenericDerived)},
        ani_native_function{"test_StringBox_Inheritance", ":i", reinterpret_cast<void *>(test_StringBox_Inheritance)},
        ani_native_function{"test_GenericPair_TwoParams", ":i", reinterpret_cast<void *>(test_GenericPair_TwoParams)},
    };
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return (ani_status)ANI_RES_OUT_OF_REF;
    }

    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_ARGS;
    }

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_TYPE;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "entry.src.main.src.ets.Index.Foo");
    *result = ANI_VERSION_1;
    return ANI_OK;
}