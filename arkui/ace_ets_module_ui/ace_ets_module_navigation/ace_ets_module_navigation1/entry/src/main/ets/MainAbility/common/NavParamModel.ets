export class NavParamOne {
  public desc: string = 'NavParamOne'
  public color: string = '#ccc'
}

export class NavParamTwo {
  public desc: string = 'NavParamTwo'

  constructor(desc?: string) {
    if (desc) {
      this.desc = desc;
    }
  }
}
