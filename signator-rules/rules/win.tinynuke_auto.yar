rule win_tinynuke_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tinynuke."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tinynuke"
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
        $sequence_0 = { c3 55 8bec 817d0c00040000 }
            // n = 4, score = 1600
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   817d0c00040000       | cmp                 dword ptr [ebp + 0xc], 0x400

        $sequence_1 = { 33d2 8bc6 f7f1 8a043a 30041e 46 }
            // n = 6, score = 1400
            //   33d2                 | xor                 edx, edx
            //   8bc6                 | mov                 eax, esi
            //   f7f1                 | div                 ecx
            //   8a043a               | mov                 al, byte ptr [edx + edi]
            //   30041e               | xor                 byte ptr [esi + ebx], al
            //   46                   | inc                 esi

        $sequence_2 = { 8bf8 57 ffd6 ff35???????? }
            // n = 4, score = 1400
            //   8bf8                 | mov                 edi, eax
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   ff35????????         |                     

        $sequence_3 = { 8945f4 8d85d4feffff 50 ff15???????? }
            // n = 4, score = 1400
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8d85d4feffff         | lea                 eax, [ebp - 0x12c]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_4 = { 8bd8 81fb00040000 72ea 56 53 }
            // n = 5, score = 1400
            //   8bd8                 | mov                 ebx, eax
            //   81fb00040000         | cmp                 ebx, 0x400
            //   72ea                 | jb                  0xffffffec
            //   56                   | push                esi
            //   53                   | push                ebx

        $sequence_5 = { 50 ff15???????? ff35???????? 8d85b4feffff }
            // n = 4, score = 1400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   8d85b4feffff         | lea                 eax, [ebp - 0x14c]

        $sequence_6 = { a3???????? ff75fc ff15???????? ff35???????? a3???????? ff75f4 }
            // n = 6, score = 1400
            //   a3????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   a3????????           |                     
            //   ff75f4               | push                dword ptr [ebp - 0xc]

        $sequence_7 = { 53 56 57 8d45fc 50 bb3f000f00 53 }
            // n = 7, score = 1400
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   bb3f000f00           | mov                 ebx, 0xf003f
            //   53                   | push                ebx

        $sequence_8 = { 8d8530f6ffff 50 6802020000 ff15???????? }
            // n = 4, score = 1400
            //   8d8530f6ffff         | lea                 eax, [ebp - 0x9d0]
            //   50                   | push                eax
            //   6802020000           | push                0x202
            //   ff15????????         |                     

        $sequence_9 = { ff75ec ff75fc e8???????? 83c40c 5f }
            // n = 5, score = 1300
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   5f                   | pop                 edi

        $sequence_10 = { ff35???????? 8d85a4feffff 50 ff15???????? }
            // n = 4, score = 1300
            //   ff35????????         |                     
            //   8d85a4feffff         | lea                 eax, [ebp - 0x15c]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_11 = { ff75fc ff15???????? a3???????? ff35???????? }
            // n = 4, score = 1200
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   a3????????           |                     
            //   ff35????????         |                     

        $sequence_12 = { ff15???????? ff35???????? 8d85a8feffff 50 }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   8d85a8feffff         | lea                 eax, [ebp - 0x158]
            //   50                   | push                eax

        $sequence_13 = { a3???????? ff35???????? ff75fc ff15???????? }
            // n = 4, score = 900
            //   a3????????           |                     
            //   ff35????????         |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     

        $sequence_14 = { 6a2a 50 8945fc ff15???????? }
            // n = 4, score = 800
            //   6a2a                 | push                0x2a
            //   50                   | push                eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff15????????         |                     

        $sequence_15 = { a3???????? ff35???????? ff75ec ff15???????? }
            // n = 4, score = 800
            //   a3????????           |                     
            //   ff35????????         |                     
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff15????????         |                     

        $sequence_16 = { c70604000000 e8???????? eb18 83f803 }
            // n = 4, score = 800
            //   c70604000000         | mov                 dword ptr [esi], 4
            //   e8????????           |                     
            //   eb18                 | jmp                 0x1a
            //   83f803               | cmp                 eax, 3

        $sequence_17 = { ff15???????? ff35???????? ff7508 ff15???????? 68???????? ff7508 }
            // n = 6, score = 800
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   68????????           |                     
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_18 = { 8b02 8a00 3c0a 7409 }
            // n = 4, score = 800
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   8a00                 | mov                 al, byte ptr [eax]
            //   3c0a                 | cmp                 al, 0xa
            //   7409                 | je                  0xb

        $sequence_19 = { eb18 83f803 7519 ff7608 }
            // n = 4, score = 800
            //   eb18                 | jmp                 0x1a
            //   83f803               | cmp                 eax, 3
            //   7519                 | jne                 0x1b
            //   ff7608               | push                dword ptr [esi + 8]

        $sequence_20 = { a3???????? 68e2010000 68???????? 68???????? e8???????? }
            // n = 5, score = 800
            //   a3????????           |                     
            //   68e2010000           | push                0x1e2
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_21 = { ff7508 ff15???????? ff35???????? ff7508 }
            // n = 4, score = 800
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_22 = { 3c0a 7409 3c0d 740f }
            // n = 4, score = 800
            //   3c0a                 | cmp                 al, 0xa
            //   7409                 | je                  0xb
            //   3c0d                 | cmp                 al, 0xd
            //   740f                 | je                  0x11

        $sequence_23 = { ff15???????? 8b35???????? 8d430c 50 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   8d430c               | lea                 eax, [ebx + 0xc]
            //   50                   | push                eax

        $sequence_24 = { 7537 c744241400000000 c744241000000000 c744240c00000000 }
            // n = 4, score = 100
            //   7537                 | jne                 0x39
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0
            //   c744241000000000     | mov                 dword ptr [esp + 0x10], 0
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0

        $sequence_25 = { 81fb???????? 732e 8b5304 b904000000 8d820000e06e 8b920000e06e 0313 }
            // n = 7, score = 100
            //   81fb????????         |                     
            //   732e                 | jae                 0x30
            //   8b5304               | mov                 edx, dword ptr [ebx + 4]
            //   b904000000           | mov                 ecx, 4
            //   8d820000e06e         | lea                 eax, [edx + 0x6ee00000]
            //   8b920000e06e         | mov                 edx, dword ptr [edx + 0x6ee00000]
            //   0313                 | add                 edx, dword ptr [ebx]

        $sequence_26 = { d1ea 7432 8d4608 8d7c5608 }
            // n = 4, score = 100
            //   d1ea                 | shr                 edx, 1
            //   7432                 | je                  0x34
            //   8d4608               | lea                 eax, [esi + 8]
            //   8d7c5608             | lea                 edi, [esi + edx*2 + 8]

        $sequence_27 = { 85c0 745c 01d8 890424 e8???????? 83ec04 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   745c                 | je                  0x5e
            //   01d8                 | add                 eax, ebx
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec04               | sub                 esp, 4

        $sequence_28 = { 83ec08 891c24 c744241881000000 c744241400000000 c744241000000000 }
            // n = 5, score = 100
            //   83ec08               | sub                 esp, 8
            //   891c24               | mov                 dword ptr [esp], ebx
            //   c744241881000000     | mov                 dword ptr [esp + 0x18], 0x81
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0
            //   c744241000000000     | mov                 dword ptr [esp + 0x10], 0

        $sequence_29 = { 0fb609 2bc8 33c0 85c9 }
            // n = 4, score = 100
            //   0fb609               | movzx               ecx, byte ptr [ecx]
            //   2bc8                 | sub                 ecx, eax
            //   33c0                 | xor                 eax, eax
            //   85c9                 | test                ecx, ecx

        $sequence_30 = { 8b06 85c0 75b7 8b7c241c 8b8780000000 01d8 }
            // n = 6, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   75b7                 | jne                 0xffffffb9
            //   8b7c241c             | mov                 edi, dword ptr [esp + 0x1c]
            //   8b8780000000         | mov                 eax, dword ptr [edi + 0x80]
            //   01d8                 | add                 eax, ebx

        $sequence_31 = { 89c6 8b442418 8b38 8b6810 }
            // n = 4, score = 100
            //   89c6                 | mov                 esi, eax
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   8b6810               | mov                 ebp, dword ptr [eax + 0x10]

        $sequence_32 = { 0fb7d1 893424 0f48c2 83c704 83c504 }
            // n = 5, score = 100
            //   0fb7d1               | movzx               edx, cx
            //   893424               | mov                 dword ptr [esp], esi
            //   0f48c2               | cmovs               eax, edx
            //   83c704               | add                 edi, 4
            //   83c504               | add                 ebp, 4

    condition:
        7 of them and filesize < 1196032
}