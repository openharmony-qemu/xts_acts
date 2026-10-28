declare interface WebAttribute {
  enableBlankScreenMonitor(enable: boolean | undefined): WebAttribute;
  blankScreenDetectionConfig(config: ESObject): WebAttribute;
  width(value: Length): WebAttribute;
}
