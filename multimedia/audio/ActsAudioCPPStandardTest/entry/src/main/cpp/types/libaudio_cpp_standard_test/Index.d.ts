/**
 * OpenSLES Player Function Test
 * @param caseNumber - Test case number (0-1)
 *   0: SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 *   1: SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @returns 0 on success, -1 on failure
 */
export const openslesPlayerFunctionTest: (caseNumber: number) => number;

/**
 * OpenSLES Engine Invalid Test
 * @param caseNumber - Test case number (0-3)
 *   0: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
 *   1: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
 *   2: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
 *   3: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
 * @returns 0 on success, -1 on failure
 */
export const openslesEngineInvalidTest: (caseNumber: number) => number;