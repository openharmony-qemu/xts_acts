declare interface WebAttribute {
  enableBlankScreenMonitor(enable: boolean | undefined): WebAttribute;
  blankScreenDetectionConfig(config: Record<string, Object>): WebAttribute;
  width(value: Length): WebAttribute;
}
