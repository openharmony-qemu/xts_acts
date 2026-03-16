export function getDSTBoundaries(year) {
    // 通过比较每月的偏移量来找到夏令时转换点
    let dstStart, dstEnd;
    let currentOffset = null;

    for (let month = 0; month < 12; month++) {
        const date = new Date(year, month, 15);
        const offset = -date.getTimezoneOffset();

        if (currentOffset !== null && offset !== currentOffset) {
            if (offset > currentOffset) {
                // 偏移量增加，进入夏令时（时间往前拨）
                dstStart = new Date(year, month, 1);
                // 向前查找确切日期
                for (let day = 1; day <= 31; day++) {
                    const testDate = new Date(year, month, day);
                    if (-testDate.getTimezoneOffset() > currentOffset) {
                        dstStart = testDate;
                        break;
                    }
                }
            } else {
                // 偏移量减少，退出夏令时（时间往后拨）
                dstEnd = new Date(year, month, 1);
                // 向前查找确切日期
                for (let day = 1; day <= 31; day++) {
                    const testDate = new Date(year, month, day);
                    if (-testDate.getTimezoneOffset() < currentOffset) {
                        dstEnd = testDate;
                        break;
                    }
                }
            }
        }
        currentOffset = offset;
    }

    return { dstStart, dstEnd };
}


export function isDaylightSavingTime(date) {
    const year = date.getFullYear();
    const jan = new Date(year, 0, 1);
    const jul = new Date(year, 6, 1);
    const standardOffset = -jan.getTimezoneOffset();
    const daylightOffset = -jul.getTimezoneOffset();
    const currentOffset = -date.getTimezoneOffset();

    // 如果当前偏移量等于夏季偏移量，则处于夏令时
    return currentOffset === daylightOffset && standardOffset !== daylightOffset;
}





