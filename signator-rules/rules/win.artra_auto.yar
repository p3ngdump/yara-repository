rule win_artra_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.artra."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.artra"
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
        $sequence_0 = { 83c41c c21000 5f 33c0 5e }
            // n = 5, score = 800
            //   83c41c               | add                 esp, 0x1c
            //   c21000               | ret                 0x10
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi

        $sequence_1 = { 8b442410 5f 5e 83c41c c21000 }
            // n = 5, score = 800
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   83c41c               | add                 esp, 0x1c
            //   c21000               | ret                 0x10

        $sequence_2 = { 5f 8a08 40 84c9 75f9 2bc2 880c30 }
            // n = 7, score = 700
            //   5f                   | pop                 edi
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   880c30               | mov                 byte ptr [eax + esi], cl

        $sequence_3 = { 800431f3 8bc6 41 8d7801 }
            // n = 4, score = 700
            //   800431f3             | add                 byte ptr [ecx + esi], 0xf3
            //   8bc6                 | mov                 eax, esi
            //   41                   | inc                 ecx
            //   8d7801               | lea                 edi, [eax + 1]

        $sequence_4 = { 8bc6 57 33c9 8d7801 8da42400000000 }
            // n = 5, score = 700
            //   8bc6                 | mov                 eax, esi
            //   57                   | push                edi
            //   33c9                 | xor                 ecx, ecx
            //   8d7801               | lea                 edi, [eax + 1]
            //   8da42400000000       | lea                 esp, [esp]

        $sequence_5 = { 2bc7 3bc8 72e3 8bc6 8d5001 5f 8a08 }
            // n = 7, score = 700
            //   2bc7                 | sub                 eax, edi
            //   3bc8                 | cmp                 ecx, eax
            //   72e3                 | jb                  0xffffffe5
            //   8bc6                 | mov                 eax, esi
            //   8d5001               | lea                 edx, [eax + 1]
            //   5f                   | pop                 edi
            //   8a08                 | mov                 cl, byte ptr [eax]

        $sequence_6 = { 8a08 880a 40 42 84c9 75f6 e8???????? }
            // n = 7, score = 600
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   880a                 | mov                 byte ptr [edx], cl
            //   40                   | inc                 eax
            //   42                   | inc                 edx
            //   84c9                 | test                cl, cl
            //   75f6                 | jne                 0xfffffff8
            //   e8????????           |                     

        $sequence_7 = { 8d54241c 52 ffd7 85c0 75cc 5d }
            // n = 6, score = 600
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   75cc                 | jne                 0xffffffce
            //   5d                   | pop                 ebp

        $sequence_8 = { 7445 53 8b1d???????? 55 8b2d???????? 90 }
            // n = 6, score = 600
            //   7445                 | je                  0x47
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   55                   | push                ebp
            //   8b2d????????         |                     
            //   90                   | nop                 

        $sequence_9 = { 2bc2 03fb 8a4f01 47 84c9 75f8 8bc8 }
            // n = 7, score = 600
            //   2bc2                 | sub                 eax, edx
            //   03fb                 | add                 edi, ebx
            //   8a4f01               | mov                 cl, byte ptr [edi + 1]
            //   47                   | inc                 edi
            //   84c9                 | test                cl, cl
            //   75f8                 | jne                 0xfffffffa
            //   8bc8                 | mov                 ecx, eax

        $sequence_10 = { 6a00 6a00 8d442414 50 ffd7 85c0 7445 }
            // n = 7, score = 600
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7445                 | je                  0x47

        $sequence_11 = { 8bf0 e8???????? 8b3d???????? 6a00 6a00 6a00 8d442414 }
            // n = 7, score = 600
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   8b3d????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d442414             | lea                 eax, [esp + 0x14]

        $sequence_12 = { ff15???????? 8bf8 85ff 0f8488000000 6a00 57 ff15???????? }
            // n = 7, score = 600
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   0f8488000000         | je                  0x8e
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_13 = { 90 8b542410 8d4c2410 51 56 52 ffd3 }
            // n = 7, score = 600
            //   90                   | nop                 
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   51                   | push                ecx
            //   56                   | push                esi
            //   52                   | push                edx
            //   ffd3                 | call                ebx

        $sequence_14 = { 56 57 8be9 8b4520 8b00 33ff 896c2418 }
            // n = 7, score = 500
            //   56                   | push                esi
            //   57                   | push                edi
            //   8be9                 | mov                 ebp, ecx
            //   8b4520               | mov                 eax, dword ptr [ebp + 0x20]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   33ff                 | xor                 edi, edi
            //   896c2418             | mov                 dword ptr [esp + 0x18], ebp

        $sequence_15 = { 8b4620 c70000000000 8b4e30 c70100000000 c3 6aff }
            // n = 6, score = 500
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   8b4e30               | mov                 ecx, dword ptr [esi + 0x30]
            //   c70100000000         | mov                 dword ptr [ecx], 0
            //   c3                   | ret                 
            //   6aff                 | push                -1

        $sequence_16 = { 8b4a3c 8b11 8b5218 8d442410 }
            // n = 4, score = 500
            //   8b4a3c               | mov                 ecx, dword ptr [edx + 0x3c]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b5218               | mov                 edx, dword ptr [edx + 0x18]
            //   8d442410             | lea                 eax, [esp + 0x10]

        $sequence_17 = { 51 6802000080 ff15???????? 8b742440 }
            // n = 4, score = 500
            //   51                   | push                ecx
            //   6802000080           | push                0x80000002
            //   ff15????????         |                     
            //   8b742440             | mov                 esi, dword ptr [esp + 0x40]

        $sequence_18 = { ffd6 85c0 75cc 5d 5b 8b442410 }
            // n = 6, score = 400
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   75cc                 | jne                 0xffffffce
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]

        $sequence_19 = { 2bd0 8a08 880c10 40 84c9 75f6 6800020000 }
            // n = 7, score = 400
            //   2bd0                 | sub                 edx, eax
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   880c10               | mov                 byte ptr [eax + edx], cl
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f6                 | jne                 0xfffffff8
            //   6800020000           | push                0x200

        $sequence_20 = { 8945e0 85c0 7461 8d0cbde03b4100 8901 8305????????20 8b11 }
            // n = 7, score = 400
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   85c0                 | test                eax, eax
            //   7461                 | je                  0x63
            //   8d0cbde03b4100       | lea                 ecx, [edi*4 + 0x413be0]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8305????????20       |                     
            //   8b11                 | mov                 edx, dword ptr [ecx]

        $sequence_21 = { b8???????? c6042f00 8d5001 8da42400000000 }
            // n = 4, score = 400
            //   b8????????           |                     
            //   c6042f00             | mov                 byte ptr [edi + ebp], 0
            //   8d5001               | lea                 edx, [eax + 1]
            //   8da42400000000       | lea                 esp, [esp]

        $sequence_22 = { 6801000080 ff15???????? 8d4c2428 51 }
            // n = 4, score = 200
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     
            //   8d4c2428             | lea                 ecx, [esp + 0x28]
            //   51                   | push                ecx

        $sequence_23 = { 6a6d 56 ff15???????? be???????? 8bf8 e8???????? }
            // n = 6, score = 200
            //   6a6d                 | push                0x6d
            //   56                   | push                esi
            //   ff15????????         |                     
            //   be????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     

        $sequence_24 = { be???????? e8???????? 6a00 8d44242c 50 6a00 683f000f00 }
            // n = 7, score = 200
            //   be????????           |                     
            //   e8????????           |                     
            //   6a00                 | push                0
            //   8d44242c             | lea                 eax, [esp + 0x2c]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   683f000f00           | push                0xf003f

    condition:
        7 of them and filesize < 811008
}