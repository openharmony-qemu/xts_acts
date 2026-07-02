/** DrawableDescriptor.release / isReleased 在部分 SDK 类型中未声明，运行时动态调用。 */

interface DrawableReleaseApi {
  release(): void;
  isReleased(): boolean;
}

function resolveDrawableApi(desc: ESObject | null | undefined): DrawableReleaseApi | null {
  if (desc === null || desc === undefined) {
    return null;
  }
  const record = desc as Record<string, Object>;
  if (typeof record['release'] !== 'function' || typeof record['isReleased'] !== 'function') {
    return null;
  }
  return desc as DrawableReleaseApi;
}

export function hasDrawableReleaseApi(desc: ESObject | null | undefined): boolean {
  return resolveDrawableApi(desc) !== null;
}

export function releaseDrawable(desc: ESObject | null | undefined): void {
  const api = resolveDrawableApi(desc);
  if (api === null) {
    throw new Error('releaseDrawable: invalid desc or missing release/isReleased API');
  }
  api.release();
}

export function isDrawableReleased(desc: ESObject | null | undefined): boolean {
  const api = resolveDrawableApi(desc);
  if (api === null) {
    return false;
  }
  return api.isReleased();
}
