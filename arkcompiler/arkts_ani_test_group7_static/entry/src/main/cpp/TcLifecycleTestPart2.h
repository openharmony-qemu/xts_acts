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

#ifndef TC_LIFECYCLE_TEST_PART2_H
#define TC_LIFECYCLE_TEST_PART2_H
ani_boolean test_LifecycleGetEnvWithoutAttach(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> failedAsExpected {false};
    std::thread worker([vm, &failedAsExpected]() {
        ani_env *threadEnv = nullptr;
        ani_status status = vm->GetEnv(ANI_VERSION_1, &threadEnv);
        failedAsExpected.store(status != ANI_OK || threadEnv == nullptr);
    });
    worker.join();
    return failedAsExpected.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleFindAppClassInAttachedThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> failedAsExpected {false};
    std::thread worker([vm, &failedAsExpected]() {
        ani_env *threadEnv = nullptr;
        if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK || threadEnv == nullptr) {
            return;
        }
        ani_class cls = nullptr;
        ani_status status = threadEnv->FindClass(tc_lifecycle_test::LIFECYCLE_FOO_CLASS, &cls);
        failedAsExpected.store(status != ANI_OK || cls == nullptr);
        if (status != ANI_OK) {
            threadEnv->ResetError();
        }
        vm->DetachCurrentThread();
    });
    worker.join();
    return failedAsExpected.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleUseCachedClassInAttachedThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    ani_class cls = nullptr;
    ani_status status = env->FindClass(tc_lifecycle_test::LIFECYCLE_FOO_CLASS, &cls);
    if (status != ANI_OK || cls == nullptr) {
        return ANI_FALSE;
    }
    ani_ref classRef = nullptr;
    status = env->GlobalReference_Create(reinterpret_cast<ani_ref>(cls), &classRef);
    if (status != ANI_OK || classRef == nullptr) {
        return ANI_FALSE;
    }
    {
        std::lock_guard<std::mutex> lock(tc_lifecycle_test::g_lifecycleMutex);
        if (tc_lifecycle_test::g_cachedFooClassRef != nullptr) {
            env->GlobalReference_Delete(tc_lifecycle_test::g_cachedFooClassRef);
        }
        tc_lifecycle_test::g_cachedFooClassRef = classRef;
    }
    std::atomic<bool> ok {false};
    std::thread worker([vm, &ok]() {
        ani_env *threadEnv = nullptr;
        if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK || threadEnv == nullptr) {
            return;
        }
        ani_ref cached = nullptr;
        {
            std::lock_guard<std::mutex> lock(tc_lifecycle_test::g_lifecycleMutex);
            cached = tc_lifecycle_test::g_cachedFooClassRef;
        }
        ani_class cachedCls = reinterpret_cast<ani_class>(cached);
        ani_method ctor = nullptr;
        ani_status ctorStatus = threadEnv->Class_FindMethod(cachedCls, "<ctor>", nullptr, &ctor);
        ani_object obj = nullptr;
        ani_status newStatus = ANI_ERROR;
        if (ctorStatus == ANI_OK) {
            newStatus = threadEnv->Object_New(cachedCls, ctor, &obj);
        }
        ok.store(ctorStatus == ANI_OK && newStatus == ANI_OK && obj != nullptr);
        vm->DetachCurrentThread();
    });
    worker.join();
    return ok.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleAttachWithInteropOption(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> ok {false};
    std::thread worker([vm, &ok]() {
        ani_env *threadEnv = nullptr;
        ani_option option {
            "--interop=enable",
            nullptr
        };
        ani_options options {
            1,
            &option
        };
        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &threadEnv);
        if (status == ANI_OK && threadEnv != nullptr) {
            ani_string str = nullptr;
            ani_status stringStatus = threadEnv->String_NewUTF8("interop-enabled",
                std::strlen("interop-enabled"), &str);
            ok.store(stringStatus == ANI_OK && str != nullptr);
            vm->DetachCurrentThread();
        }
    });
    worker.join();
    return ok.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleCreateVmWithLoggerOption(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    tc_lifecycle_test::g_loggerCallCount.store(0);
    ani_option option {
        "--logger",
        reinterpret_cast<void *>(tc_lifecycle_test::MyLifecycleLogger)
    };
    ani_options options {
        1,
        &option
    };
    ani_vm *newVm = nullptr;
    ani_status status = tc_lifecycle_test::CallANICreateVM(&options, ANI_VERSION_1, &newVm);
    if (status == ANI_OK && newVm != nullptr) {
        newVm->DestroyVM();
        return ANI_TRUE;
    }
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleCreateVmWithVerifyAniAndMisuse(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_option option {
        "--verify:ani",
        nullptr
    };
    ani_options options {
        1,
        &option
    };
    ani_vm *newVm = nullptr;
    ani_status status = tc_lifecycle_test::CallANICreateVM(&options, ANI_VERSION_1, &newVm);
    if (status == ANI_OK && newVm != nullptr) {
        ani_env *newEnv = nullptr;
        ani_status envStatus = newVm->GetEnv(ANI_VERSION_1, &newEnv);
        newVm->DestroyVM();
        return envStatus == ANI_OK ? ANI_TRUE : ANI_FALSE;
    }
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleCreateVmWithVerifyAniNoCrashOption(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_option option {
        "--verify:ani:workround:no_crash_if_invalid_usage",
        nullptr
    };
    ani_options options {
        1,
        &option
    };
    ani_vm *newVm = nullptr;
    ani_status status = tc_lifecycle_test::CallANICreateVM(&options, ANI_VERSION_1, &newVm);
    if (status == ANI_OK && newVm != nullptr) {
        newVm->DestroyVM();
        return ANI_TRUE;
    }
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleCreateVmWithBootPandaFiles(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_option option {
        "--ext:boot-panda-files",
        const_cast<char *>("etsstdlib.abc")
    };
    ani_options options {
        1,
        &option
    };
    ani_vm *newVm = nullptr;
    ani_status status = tc_lifecycle_test::CallANICreateVM(&options, ANI_VERSION_1, &newVm);
    if (status == ANI_OK && newVm != nullptr) {
        ani_env *newEnv = nullptr;
        ani_status envStatus = newVm->GetEnv(ANI_VERSION_1, &newEnv);
        newVm->DestroyVM();
        return envStatus == ANI_OK ? ANI_TRUE : ANI_FALSE;
    }
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleAttachWithBootPandaFilesOption(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> failedOrIgnored {false};
    std::thread worker([vm, &failedOrIgnored]() {
        ani_env *threadEnv = nullptr;
        ani_option option {
            "--ext:boot-panda-files",
            const_cast<char *>("etsstdlib.abc")
        };
        ani_options options {
            1,
            &option
        };
        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &threadEnv);
        if (status == ANI_OK && threadEnv != nullptr) {
            vm->DetachCurrentThread();
            failedOrIgnored.store(true);
            return;
        }
        failedOrIgnored.store(status != ANI_OK);
    });
    worker.join();
    return failedOrIgnored.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleNestedLocalScopes(ani_env *env, ani_object object)
{
    (void)object;
    ani_status outerStatus = env->CreateLocalScope(8);
    if (!AssertEqMsg(outerStatus, ANI_OK, "Create outer local scope failed")) {
        return ANI_FALSE;
    }
    ani_string outerString = tc_lifecycle_test::NewString(env, "outer");
    if (outerString == nullptr) {
        env->DestroyLocalScope();
        return ANI_FALSE;
    }
    ani_status innerStatus = env->CreateLocalScope(8);
    if (innerStatus != ANI_OK) {
        env->DestroyLocalScope();
    }
    if (!AssertEqMsg(innerStatus, ANI_OK, "Create inner local scope failed")) {
        return ANI_FALSE;
    }
    ani_string innerString = tc_lifecycle_test::NewString(env, "inner");
    if (innerString == nullptr) {
        env->DestroyLocalScope();
        env->DestroyLocalScope();
        return ANI_FALSE;
    }
    ani_status destroyInner = env->DestroyLocalScope();
    std::string outerValue = tc_lifecycle_test::ToStdString(env, outerString);
    ani_status destroyOuter = env->DestroyLocalScope();
    return destroyInner == ANI_OK && destroyOuter == ANI_OK && outerValue == "outer" ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleUseDeletedGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    ani_object obj = tc_lifecycle_test::CreateFooObject(env, 2200);
    if (obj == nullptr) {
        return ANI_FALSE;
    }
    ani_ref gref = nullptr;
    ani_status createStatus = env->GlobalReference_Create(reinterpret_cast<ani_ref>(obj), &gref);
    if (createStatus != ANI_OK || gref == nullptr) {
        return ANI_FALSE;
    }
    ani_status deleteStatus = env->GlobalReference_Delete(gref);
    ani_int value = tc_lifecycle_test::ReadFooFactor(env, reinterpret_cast<ani_object>(gref));
    return deleteStatus == ANI_OK && value < 0 ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleAttachWithoutDetachLeak(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<int> attachedCount {0};
    std::vector<std::thread> threads;
    for (ani_int i = 0; i < count; i++) {
        threads.emplace_back([vm, &attachedCount]() {
            ani_env *threadEnv = nullptr;
            ani_status status = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
            if (status == ANI_OK && threadEnv != nullptr) {
                ani_string str = nullptr;
                threadEnv->String_NewUTF8("attached-without-detach",
                    std::strlen("attached-without-detach"), &str);
                attachedCount.fetch_add(1);
            }
        });
    }
    for (auto &thread : threads) {
        thread.join();
    }
    return attachedCount.load() == count ? ANI_TRUE : ANI_FALSE;
}
#endif
