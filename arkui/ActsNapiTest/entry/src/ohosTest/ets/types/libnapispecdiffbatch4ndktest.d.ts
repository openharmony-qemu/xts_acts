/**
 * NAPI Spec Diff Batch4 Native Test 模块类型声明 (Stress Probe)
 */
declare module 'libnapispecdiffbatch4ndktest.so' {
 
  export function setElementHugeIndexDoesNotMutateObject(): number;
  export function fatalExceptionRejectsNonError(): number;
  export function externalStringUtf16AndAsciiCreate(): number;
  export function createDateExtremeReturnsStatus(): number;
  export function callFunctionNullRecvIsolatedProbe(): number;
  export function tsfnDestroyRuntimeWithoutExplicitCleanupProbe(): number;
  export function createBigintHugeWordsProbe(): number;
  export function createArrayWithHugeLengthProbe(): number;
  export function createArrayBufferWithHugeLengthProbe(): number;
  export function criticalScopeForbiddenNapiCrashProbe(): number;

  // ===== 新增 16 个测试函数 =====
  export function testHasElementAbnormalParams(): number;
  export function testHasElementReturnValue(): number;
  export function testFatalExceptionNormalParams(): number;
  export function testFatalExceptionReturnValue(): number;
  export function testFatalExceptionNormalScene(): number;
  export function testFatalExceptionAbnormalScene(): number;
  export function testFatalExceptionCombination(): number;
  export function testExternalStringUtf16ReturnValue(): number;
  export function testExternalStringUtf16NormalScene(): number;
  export function testExternalStringUtf16AbnormalScene(): number;
  export function testExternalStringUtf16Combination(): number;
  export function testExternalStringAsciiNullParam(): number;
  export function testExternalStringAsciiReturnValue(): number;
  export function testExternalStringAsciiNormalScene(): number;
  export function testExternalStringAsciiNonAscii(): number;
  export function testExternalStringAsciiCombination(): number;
  // ===== napi_create_date 相关 =====
  export function testCreateDateNanScene(): number;
  export function testCreateDateCombination(): number;

  // ===== napi_create_threadsafe_function 相关 =====
  export function testCreateThreadsafeFunctionAbnormalParams(): number;

  // ===== napi_call_threadsafe_function 相关 =====
  export function testCallThreadsafeFunctionAbnormalParams(): number;

  // ===== napi_create_bigint_words 相关 =====
  export function testCreateBigintWordsCombination(): number;

  // ===== napi_add_finalizer 相关 =====
  export function testAddFinalizerAbnormalParams(): number;
  export function testAddFinalizerReturnValue(): number;
  export function testAddFinalizerCombination(): number;

  // ===== napi_get_uv_event_loop 相关 =====
  export function testGetUvEventLoopAbnormalParams(): number;
  export function testGetUvEventLoopAbnormalScene(): number;
  export function testGetUvEventLoopCombination(): number;
  export function testGetUvEventLoopNonMainThread(): number;
  export function testGetUvEventLoopWithThreadsafeFunction(): number;

  // ===== napi_create_array_with_length 相关 =====
  export function testCreateArrayWithLengthAbnormalParams(): number;
  export function testCreateArrayWithLengthReturnValue(): number;

  // ===== napi_create_arraybuffer 相关 =====
  export function testCreateArraybufferZeroLengthScene(): number;

  // ===== napi_open_critical_scope 相关 =====
  export function testOpenCriticalScopeNormalParams(): number;
  export function testOpenCriticalScopeReturnValue(): number;
  export function testOpenCriticalScopeAbnormalParams(): number;
  export function testOpenCriticalScopeAbnormalScene(): number;

  // ===== napi_close_critical_scope 相关 =====
  export function testCloseCriticalScopeAbnormalParams(): number;
  export function testCloseCriticalScopeReturnValue(): number;
  export function testCloseCriticalScopeAbnormalScene(): number;
  export function testCloseCriticalScopeCombination(): number;

  // ===== napi_create_ark_runtime 相关 =====
  export function testCreateArkRuntimeCombination(): number;

  // ===== napi_is_exception_pending 相关 =====
  export function testIsExceptionPendingAbnormalScene(): number;
  export function testIsExceptionPendingCombination(): number;

  // ===== napi_get_undefined 相关 =====
  export function testGetUndefinedAbnormalParams(): number;
  export function testGetUndefinedNormalScene(): number;

  // ===== napi_create_int32 相关 =====
  export function testCreateInt32AbnormalScene(): number;

  // ===== napi_set_element 相关 =====
  export function setElementNonObjectReturnsObjectExpected(): number;

  // ===== napi_critical_scope 禁止操作探针 =====
  export function criticalScopeForbiddenNapiCrashProbe(): number;
}
