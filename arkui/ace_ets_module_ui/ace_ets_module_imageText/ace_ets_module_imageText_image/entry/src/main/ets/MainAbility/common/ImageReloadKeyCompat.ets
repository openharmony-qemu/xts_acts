/** Image 构造第二参在 SDK 类型为 ImageAIOptions，运行时 overload 仍接受 reloadKey 字符串。 */

export function asReloadKeyParam(key: string | null | undefined): ImageAIOptions {
  return key as ESObject as ImageAIOptions;
}

interface ImageReloadKeyApi {
  reloadKey(value: string | null | undefined): void;
}

class ImageReloadKeyModifier implements AttributeModifier<ImageAttribute> {
  private reloadKeyVal: string | null | undefined;

  constructor(reloadKeyVal: string | null | undefined) {
    this.reloadKeyVal = reloadKeyVal;
  }

  applyNormalAttribute(instance: ImageAttribute): void {
    const img = instance as ESObject as ImageReloadKeyApi;
    const fn = (img as ESObject as Record<string, Object>)['reloadKey'];
    if (typeof fn === 'function') {
      img.reloadKey(this.reloadKeyVal);
    }
  }
}

export function imageReloadKeyModifier(key: string | null | undefined): ImageReloadKeyModifier {
  return new ImageReloadKeyModifier(key);
}
