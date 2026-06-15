/** DrawableDescriptor.release / isReleased 在部分 SDK 类型中未声明，运行时动态调用。 */

interface DrawableReleaseApi {
  release(): void;
  isReleased(): boolean;
}

export function releaseDrawable(desc: ESObject): void {
  const api = desc as DrawableReleaseApi;
  api.release();
}

export function isDrawableReleased(desc: ESObject): boolean {
  const api = desc as DrawableReleaseApi;
  return api.isReleased();
}
