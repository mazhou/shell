#!/bin/sh

str1="aaa"
str2="aaa"

if [ "$str1" = "$str2" ]; then
	echo "equal"
else
	echo "not equal"
fi

num1=1
num2=1
if [ $num1 -eq $num2 ]; then
	echo "equal"
else
	echo "not equal"
fi

if [ -e iff1.sh ]; then
	echo "equal"
else
	echo "not equal"
fi

# 字符串比较运算符 （请注意引号的使用，这是防止空格扰乱代码的好方法）
# -z string: 如果 string长度为零，则为真 [ -z "$myvar" ]
# -n string: 如果 string长度非零，则为真 [ -n "$myvar" ]
# string1 = string2: 如果 string1与 string2相同，则为真 [ "$myvar" = "one two three" ]
# string1 != string2: 如果 string1与 string2不同，则为真 [ "$myvar" != "one two three" ]

# 算术比较运算符
# num1-eq num2 等于 [ 3 -eq $mynum ]
# num1-ne num2 不等于 [ 3 -ne $mynum ]
# num1-lt num2 小于 [ 3 -lt $mynum ]
# num1-le num2 小于或等于 [ 3 -le $mynum ]
# num1-gt num2 大于 [ 3 -gt $mynum ]
# num1-ge num2 大于或等于 [ 3 -ge $mynum ]。

# 文件比较运算符
# -e filename 如果 filename存在，则为真 [ -e /var/log/syslog ]
# -d filename 如果 filename为目录，则为真 [ -d /tmp/mydir ]
# -f filename 如果 filename为常规文件，则为真 [ -f /usr/bin/grep ]
# -L filename 如果 filename为符号链接，则为真 [ -L /usr/bin/grep ]
# -r filename 如果 filename可读，则为真 [ -r /var/log/syslog ]
# -w filename 如果 filename可写，则为真 [ -w /var/mytmp.txt ]
# -x filename 如果 filename可执行，则为真 [ -L /usr/bin/grep ]

# 文件新旧运算符
# filename1-nt filename2 如果 filename1比 filename2新，则为真 [ /tmp/install/etc/services -nt /etc/services ]
# filename1-ot filename2 如果 filename1比 filename2旧，则为真 [ /boot/bzImage -ot arch/i386/boot/bzImage ]
