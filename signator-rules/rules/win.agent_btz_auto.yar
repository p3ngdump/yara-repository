rule win_agent_btz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.agent_btz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.agent_btz"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { c74608ffffffff f644240801 7409 56 e8???????? 83c404 8bc6 }
            // n = 7, score = 2500
            //   c74608ffffffff       | mov                 dword ptr [esi + 8], 0xffffffff
            //   f644240801           | test                byte ptr [esp + 8], 1
            //   7409                 | je                  0xb
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8bc6                 | mov                 eax, esi

        $sequence_1 = { 51 ffd6 8d54240c 52 ffd7 }
            // n = 5, score = 2500
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   8d54240c             | lea                 edx, [esp + 0xc]
            //   52                   | push                edx
            //   ffd7                 | call                edi

        $sequence_2 = { ffd3 85c0 75d8 5f 5e 5b }
            // n = 6, score = 2500
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   75d8                 | jne                 0xffffffda
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_3 = { b805000f00 8b4df4 64890d00000000 5f 5e 5b }
            // n = 6, score = 2400
            //   b805000f00           | mov                 eax, 0xf0005
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_4 = { c706???????? c7460c00000000 895e08 895e04 }
            // n = 4, score = 2400
            //   c706????????         |                     
            //   c7460c00000000       | mov                 dword ptr [esi + 0xc], 0
            //   895e08               | mov                 dword ptr [esi + 8], ebx
            //   895e04               | mov                 dword ptr [esi + 4], ebx

        $sequence_5 = { ff15???????? b804000f00 8b4df4 64890d00000000 }
            // n = 4, score = 2400
            //   ff15????????         |                     
            //   b804000f00           | mov                 eax, 0xf0004
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx

        $sequence_6 = { 895e08 895e04 c7461000000000 895e14 }
            // n = 4, score = 2400
            //   895e08               | mov                 dword ptr [esi + 8], ebx
            //   895e04               | mov                 dword ptr [esi + 4], ebx
            //   c7461000000000       | mov                 dword ptr [esi + 0x10], 0
            //   895e14               | mov                 dword ptr [esi + 0x14], ebx

        $sequence_7 = { 56 6a00 68???????? 8935???????? e8???????? }
            // n = 5, score = 2300
            //   56                   | push                esi
            //   6a00                 | push                0
            //   68????????           |                     
            //   8935????????         |                     
            //   e8????????           |                     

        $sequence_8 = { 83f8ff 740e 50 ff15???????? c74608ffffffff f644240801 7409 }
            // n = 7, score = 2200
            //   83f8ff               | cmp                 eax, -1
            //   740e                 | je                  0x10
            //   50                   | push                eax
            //   ff15????????         |                     
            //   c74608ffffffff       | mov                 dword ptr [esi + 8], 0xffffffff
            //   f644240801           | test                byte ptr [esp + 8], 1
            //   7409                 | je                  0xb

        $sequence_9 = { 8bf1 8b4608 c706???????? 85c0 7413 }
            // n = 5, score = 2200
            //   8bf1                 | mov                 esi, ecx
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   c706????????         |                     
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15

        $sequence_10 = { 8d542408 52 c744240c30000000 c744241003000000 }
            // n = 4, score = 2200
            //   8d542408             | lea                 edx, [esp + 8]
            //   52                   | push                edx
            //   c744240c30000000     | mov                 dword ptr [esp + 0xc], 0x30
            //   c744241003000000     | mov                 dword ptr [esp + 0x10], 3

        $sequence_11 = { 6801010000 ff15???????? 85c0 7415 }
            // n = 4, score = 1900
            //   6801010000           | push                0x101
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17

        $sequence_12 = { 51 6a00 6819000200 6a00 68???????? }
            // n = 5, score = 1400
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   6819000200           | push                0x20019
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_13 = { 6a0a 68???????? 6a01 6a00 }
            // n = 4, score = 1400
            //   6a0a                 | push                0xa
            //   68????????           |                     
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_14 = { 50 68???????? 6a01 68???????? e8???????? 83c410 }
            // n = 6, score = 1200
            //   50                   | push                eax
            //   68????????           |                     
            //   6a01                 | push                1
            //   68????????           |                     
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_15 = { 6a01 6a04 6a01 68???????? }
            // n = 4, score = 1100
            //   6a01                 | push                1
            //   6a04                 | push                4
            //   6a01                 | push                1
            //   68????????           |                     

        $sequence_16 = { 89461c 3dea000000 740b 3de5030000 }
            // n = 4, score = 1000
            //   89461c               | mov                 dword ptr [esi + 0x1c], eax
            //   3dea000000           | cmp                 eax, 0xea
            //   740b                 | je                  0xd
            //   3de5030000           | cmp                 eax, 0x3e5

        $sequence_17 = { 6a01 e8???????? 50 e8???????? 83c41c }
            // n = 5, score = 1000
            //   6a01                 | mov                 ecx, dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   50                   | mov                 dword ptr fs:[0], ecx
            //   e8????????           |                     
            //   83c41c               | pop                 edi

        $sequence_18 = { 50 e8???????? 83c408 6800010000 e8???????? }
            // n = 5, score = 1000
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   6800010000           | push                0x100
            //   e8????????           |                     

        $sequence_19 = { 7511 e8???????? 83c020 50 e8???????? 83c404 }
            // n = 6, score = 1000
            //   7511                 | push                0
            //   e8????????           |                     
            //   83c020               | push                1
            //   50                   | push                4
            //   e8????????           |                     
            //   83c404               | push                1

        $sequence_20 = { 6a01 68???????? e8???????? 83c414 5f 5e 5b }
            // n = 7, score = 1000
            //   6a01                 | push                1
            //   68????????           |                     
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_21 = { 0fb605???????? 66890d???????? 0fb60d???????? 660fafca }
            // n = 4, score = 1000
            //   0fb605????????       |                     
            //   66890d????????       |                     
            //   0fb60d????????       |                     
            //   660fafca             | imul                cx, dx

        $sequence_22 = { 51 03c7 6a06 ff75f8 }
            // n = 4, score = 900
            //   51                   | push                ecx
            //   03c7                 | add                 eax, edi
            //   6a06                 | push                6
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_23 = { 5f 5e 5b c9 c3 53 8d8df4feffff }
            // n = 7, score = 900
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   8d8df4feffff         | lea                 ecx, [ebp - 0x10c]

        $sequence_24 = { 8901 33c0 897e1c 5f }
            // n = 4, score = 900
            //   8901                 | mov                 dword ptr [ecx], eax
            //   33c0                 | xor                 eax, eax
            //   897e1c               | mov                 dword ptr [esi + 0x1c], edi
            //   5f                   | pop                 edi

        $sequence_25 = { c684249600000000 c684241001000047 c684241101000065 c684241201000074 c68424130100004c c684241401000061 c684241501000073 }
            // n = 7, score = 900
            //   c684249600000000     | mov                 byte ptr [esp + 0x96], 0
            //   c684241001000047     | mov                 byte ptr [esp + 0x110], 0x47
            //   c684241101000065     | mov                 byte ptr [esp + 0x111], 0x65
            //   c684241201000074     | mov                 byte ptr [esp + 0x112], 0x74
            //   c68424130100004c     | mov                 byte ptr [esp + 0x113], 0x4c
            //   c684241401000061     | mov                 byte ptr [esp + 0x114], 0x61
            //   c684241501000073     | mov                 byte ptr [esp + 0x115], 0x73

        $sequence_26 = { c684248c00000074 c684248d00000065 c684248e00000050 c684248f00000072 c68424900000006f c684249100000063 }
            // n = 6, score = 900
            //   c684248c00000074     | mov                 byte ptr [esp + 0x8c], 0x74
            //   c684248d00000065     | mov                 byte ptr [esp + 0x8d], 0x65
            //   c684248e00000050     | mov                 byte ptr [esp + 0x8e], 0x50
            //   c684248f00000072     | mov                 byte ptr [esp + 0x8f], 0x72
            //   c68424900000006f     | mov                 byte ptr [esp + 0x90], 0x6f
            //   c684249100000063     | mov                 byte ptr [esp + 0x91], 0x63

        $sequence_27 = { 59 53 6800004004 53 53 8d4dd8 51 }
            // n = 7, score = 900
            //   59                   | pop                 ecx
            //   53                   | push                ebx
            //   6800004004           | push                0x4400000
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   51                   | push                ecx

        $sequence_28 = { 68e8030000 b800020000 50 50 6a01 6a06 }
            // n = 6, score = 900
            //   68e8030000           | push                0x3e8
            //   b800020000           | mov                 eax, 0x200
            //   50                   | push                eax
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6a06                 | push                6

        $sequence_29 = { c684241501000073 c684241601000074 c684241701000045 c684241801000072 c684241901000072 c684241a0100006f c684241b01000072 }
            // n = 7, score = 900
            //   c684241501000073     | mov                 byte ptr [esp + 0x115], 0x73
            //   c684241601000074     | mov                 byte ptr [esp + 0x116], 0x74
            //   c684241701000045     | mov                 byte ptr [esp + 0x117], 0x45
            //   c684241801000072     | mov                 byte ptr [esp + 0x118], 0x72
            //   c684241901000072     | mov                 byte ptr [esp + 0x119], 0x72
            //   c684241a0100006f     | mov                 byte ptr [esp + 0x11a], 0x6f
            //   c684241b01000072     | mov                 byte ptr [esp + 0x11b], 0x72

        $sequence_30 = { 5f 5e 8bc3 5b c9 c3 83c8ff }
            // n = 7, score = 900
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c3                   | ret                 
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_31 = { c684249300000073 c684249400000073 c684249500000057 c684249600000000 c684241001000047 }
            // n = 5, score = 900
            //   c684249300000073     | mov                 byte ptr [esp + 0x93], 0x73
            //   c684249400000073     | mov                 byte ptr [esp + 0x94], 0x73
            //   c684249500000057     | mov                 byte ptr [esp + 0x95], 0x57
            //   c684249600000000     | mov                 byte ptr [esp + 0x96], 0
            //   c684241001000047     | mov                 byte ptr [esp + 0x110], 0x47

        $sequence_32 = { c684248900000072 c684248a00000065 c684248b00000061 c684248c00000074 c684248d00000065 c684248e00000050 }
            // n = 6, score = 900
            //   c684248900000072     | mov                 byte ptr [esp + 0x89], 0x72
            //   c684248a00000065     | mov                 byte ptr [esp + 0x8a], 0x65
            //   c684248b00000061     | mov                 byte ptr [esp + 0x8b], 0x61
            //   c684248c00000074     | mov                 byte ptr [esp + 0x8c], 0x74
            //   c684248d00000065     | mov                 byte ptr [esp + 0x8d], 0x65
            //   c684248e00000050     | mov                 byte ptr [esp + 0x8e], 0x50

        $sequence_33 = { 68ffff0000 8d85f8fffeff 50 ff36 }
            // n = 4, score = 900
            //   68ffff0000           | push                0xffff
            //   8d85f8fffeff         | lea                 eax, [ebp - 0x10008]
            //   50                   | push                eax
            //   ff36                 | push                dword ptr [esi]

        $sequence_34 = { c684248f00000072 c68424900000006f c684249100000063 c684249200000065 c684249300000073 c684249400000073 }
            // n = 6, score = 900
            //   c684248f00000072     | mov                 byte ptr [esp + 0x8f], 0x72
            //   c68424900000006f     | mov                 byte ptr [esp + 0x90], 0x6f
            //   c684249100000063     | mov                 byte ptr [esp + 0x91], 0x63
            //   c684249200000065     | mov                 byte ptr [esp + 0x92], 0x65
            //   c684249300000073     | mov                 byte ptr [esp + 0x93], 0x73
            //   c684249400000073     | mov                 byte ptr [esp + 0x94], 0x73

        $sequence_35 = { ebd2 c78424a000000068000000 c78424dc00000001000000 33c0 66898424e0000000 }
            // n = 5, score = 900
            //   ebd2                 | jmp                 0xffffffd4
            //   c78424a000000068000000     | mov    dword ptr [esp + 0xa0], 0x68
            //   c78424dc00000001000000     | mov    dword ptr [esp + 0xdc], 1
            //   33c0                 | xor                 eax, eax
            //   66898424e0000000     | mov                 word ptr [esp + 0xe0], ax

        $sequence_36 = { 6a00 6a27 6a02 6a00 6a01 }
            // n = 5, score = 800
            //   6a00                 | push                0
            //   6a27                 | push                0x27
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   6a01                 | push                1

        $sequence_37 = { c645cb30 c645cc27 c645cd3b c645ce30 }
            // n = 4, score = 700
            //   c645cb30             | push                eax
            //   c645cc27             | add                 esp, 0x14
            //   c645cd3b             | push                ecx
            //   c645ce30             | push                1

        $sequence_38 = { 8d8505feffff 50 e8???????? 83c40c }
            // n = 4, score = 700
            //   8d8505feffff         | lea                 eax, [ebp - 0x1fb]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_39 = { c645d43a c645d53b c645d63b c645d730 }
            // n = 4, score = 700
            //   c645d43a             | add                 esp, 0x14
            //   c645d53b             | push                edx
            //   c645d63b             | push                1
            //   c645d730             | push                eax

        $sequence_40 = { 488b4338 33d2 488bce 448d4220 }
            // n = 4, score = 600
            //   488b4338             | dec                 eax
            //   33d2                 | mov                 eax, dword ptr [ebx + 0x38]
            //   488bce               | xor                 edx, edx
            //   448d4220             | dec                 eax

        $sequence_41 = { 488b4608 488b0e 48894628 488b4638 4c8d4c2450 448bc3 }
            // n = 6, score = 500
            //   488b4608             | mov                 ecx, esi
            //   488b0e               | inc                 esp
            //   48894628             | lea                 eax, [edx + 0x20]
            //   488b4638             | dec                 eax
            //   4c8d4c2450           | mov                 eax, dword ptr [esi + 8]
            //   448bc3               | dec                 eax

        $sequence_42 = { 83c904 c1e803 448bc9 440fafc8 }
            // n = 4, score = 500
            //   83c904               | dec                 eax
            //   c1e803               | mov                 dword ptr [esi + 0x28], eax
            //   448bc9               | dec                 eax
            //   440fafc8             | mov                 eax, dword ptr [esi + 0x38]

        $sequence_43 = { 488bf0 c70005000000 85db 7415 }
            // n = 4, score = 500
            //   488bf0               | lea                 ecx, [esp + 0x50]
            //   c70005000000         | inc                 esp
            //   85db                 | mov                 eax, ebx
            //   7415                 | dec                 eax

        $sequence_44 = { 488b4638 488b0e 4c8d442450 4533c9 }
            // n = 4, score = 500
            //   488b4638             | dec                 eax
            //   488b0e               | mov                 ecx, dword ptr [esi]
            //   4c8d442450           | dec                 eax
            //   4533c9               | mov                 dword ptr [esi + 0x28], eax

        $sequence_45 = { 488b0f 48894108 488b0f 488b4108 48894128 488b0f }
            // n = 6, score = 500
            //   488b0f               | push                eax
            //   48894108             | add                 esp, 4
            //   488b0f               | xor                 eax, eax
            //   488b4108             | push                0x27
            //   48894128             | push                2
            //   488b0f               | push                0

        $sequence_46 = { 4154 4155 4156 4157 4883ec40 488b4138 }
            // n = 6, score = 500
            //   4154                 | dec                 eax
            //   4155                 | mov                 ecx, dword ptr [edi]
            //   4156                 | dec                 eax
            //   4157                 | mov                 ecx, dword ptr [edi]
            //   4883ec40             | dec                 eax
            //   488b4138             | mov                 dword ptr [ecx + 8], eax

        $sequence_47 = { 488b5738 488bce 8bd8 ff92e8010000 488b6c2458 }
            // n = 5, score = 500
            //   488b5738             | dec                 eax
            //   488bce               | mov                 dword ptr [esi + 0x28], eax
            //   8bd8                 | dec                 eax
            //   ff92e8010000         | mov                 eax, dword ptr [esi + 0x38]
            //   488b6c2458           | dec                 esp

        $sequence_48 = { 488bcf c744242088130000 e8???????? 488b5738 }
            // n = 4, score = 500
            //   488bcf               | dec                 eax
            //   c744242088130000     | mov                 eax, dword ptr [esi + 0x38]
            //   e8????????           |                     
            //   488b5738             | dec                 eax

        $sequence_49 = { 488b4638 ff5060 894630 3de5030000 }
            // n = 4, score = 500
            //   488b4638             | mov                 edx, edi
            //   ff5060               | dec                 eax
            //   894630               | mov                 dword ptr [esi + 0x28], eax
            //   3de5030000           | dec                 eax

        $sequence_50 = { 488b0f 894130 eb06 488b07 896830 33c0 488b5c2458 }
            // n = 7, score = 500
            //   488b0f               | push                1
            //   894130               | push                4
            //   eb06                 | push                1
            //   488b07               | mov                 byte ptr [ebp - 0x2c], 0x3a
            //   896830               | mov                 byte ptr [ebp - 0x2b], 0x3b
            //   33c0                 | mov                 byte ptr [ebp - 0x2a], 0x3b
            //   488b5c2458           | mov                 byte ptr [ebp - 0x29], 0x30

        $sequence_51 = { 488b0f 488901 488b07 488338ff }
            // n = 4, score = 500
            //   488b0f               | mov                 byte ptr [ebp - 0x29], 0x30
            //   488901               | mov                 byte ptr [ebp - 0x28], 0x36
            //   488b07               | mov                 byte ptr [ebp - 0x35], 0x30
            //   488338ff             | mov                 byte ptr [ebp - 0x34], 0x27

        $sequence_52 = { 8d8594faffff 50 68???????? ff15???????? }
            // n = 4, score = 200
            //   8d8594faffff         | lea                 eax, [ebp - 0x56c]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_53 = { 0304b5100b4200 59 5e eb05 }
            // n = 4, score = 100
            //   0304b5100b4200       | add                 eax, dword ptr [esi*4 + 0x420b10]
            //   59                   | pop                 ecx
            //   5e                   | pop                 esi
            //   eb05                 | jmp                 7

        $sequence_54 = { 0304b5100b4200 59 eb05 b8???????? }
            // n = 4, score = 100
            //   0304b5100b4200       | add                 eax, dword ptr [esi*4 + 0x420b10]
            //   59                   | pop                 ecx
            //   eb05                 | jmp                 7
            //   b8????????           |                     

        $sequence_55 = { 0304b5100b4200 59 eb02 8bc3 }
            // n = 4, score = 100
            //   0304b5100b4200       | add                 eax, dword ptr [esi*4 + 0x420b10]
            //   59                   | pop                 ecx
            //   eb02                 | jmp                 4
            //   8bc3                 | mov                 eax, ebx

        $sequence_56 = { 013d???????? 8b04b5100b4200 0500080000 3bc8 }
            // n = 4, score = 100
            //   013d????????         |                     
            //   8b04b5100b4200       | mov                 eax, dword ptr [esi*4 + 0x420b10]
            //   0500080000           | add                 eax, 0x800
            //   3bc8                 | cmp                 ecx, eax

        $sequence_57 = { 030c85100b4200 eb02 8bcb f6412480 }
            // n = 4, score = 100
            //   030c85100b4200       | add                 ecx, dword ptr [eax*4 + 0x420b10]
            //   eb02                 | jmp                 4
            //   8bcb                 | mov                 ecx, ebx
            //   f6412480             | test                byte ptr [ecx + 0x24], 0x80

        $sequence_58 = { 001cbe 40 0023 d18a0688078a 46 }
            // n = 5, score = 100
            //   001cbe               | add                 byte ptr [esi + edi*4], bl
            //   40                   | inc                 eax
            //   0023                 | add                 byte ptr [ebx], ah
            //   d18a0688078a         | ror                 dword ptr [edx - 0x75f877fa], 1
            //   46                   | inc                 esi

        $sequence_59 = { 0304b5100b4200 beffff0000 59 59 }
            // n = 4, score = 100
            //   0304b5100b4200       | add                 eax, dword ptr [esi*4 + 0x420b10]
            //   beffff0000           | mov                 esi, 0xffff
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 5577728
}