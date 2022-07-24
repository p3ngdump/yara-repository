rule win_xbtl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.xbtl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xbtl"
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
        $sequence_0 = { 56 8b7304 57 8b7d08 85f6 741a 8b06 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8b7304               | mov                 esi, dword ptr [ebx + 4]
            //   57                   | push                edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   85f6                 | test                esi, esi
            //   741a                 | je                  0x1c
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_1 = { 8d94169979825a 8bf0 c1cb02 898db0feffff 8b8db4feffff 8bc1 f7d0 }
            // n = 7, score = 100
            //   8d94169979825a       | lea                 edx, [esi + edx + 0x5a827999]
            //   8bf0                 | mov                 esi, eax
            //   c1cb02               | ror                 ebx, 2
            //   898db0feffff         | mov                 dword ptr [ebp - 0x150], ecx
            //   8b8db4feffff         | mov                 ecx, dword ptr [ebp - 0x14c]
            //   8bc1                 | mov                 eax, ecx
            //   f7d0                 | not                 eax

        $sequence_2 = { 770f 0fbec2 0fbe8020324100 83e00f eb02 33c0 0fbe84c140324100 }
            // n = 7, score = 100
            //   770f                 | ja                  0x11
            //   0fbec2               | movsx               eax, dl
            //   0fbe8020324100       | movsx               eax, byte ptr [eax + 0x413220]
            //   83e00f               | and                 eax, 0xf
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   0fbe84c140324100     | movsx               eax, byte ptr [ecx + eax*8 + 0x413240]

        $sequence_3 = { 53 03c0 50 51 e8???????? 8bd8 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   03c0                 | add                 eax, eax
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_4 = { 8b7308 83c404 837e0801 7405 }
            // n = 4, score = 100
            //   8b7308               | mov                 esi, dword ptr [ebx + 8]
            //   83c404               | add                 esp, 4
            //   837e0801             | cmp                 dword ptr [esi + 8], 1
            //   7405                 | je                  7

        $sequence_5 = { 13cb 33d2 52 8b550c 52 }
            // n = 5, score = 100
            //   13cb                 | adc                 ecx, ebx
            //   33d2                 | xor                 edx, edx
            //   52                   | push                edx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   52                   | push                edx

        $sequence_6 = { 8bd6 8b7a0c 8da42400000000 8b11 8b07 03c2 }
            // n = 6, score = 100
            //   8bd6                 | mov                 edx, esi
            //   8b7a0c               | mov                 edi, dword ptr [edx + 0xc]
            //   8da42400000000       | lea                 esp, [esp]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   03c2                 | add                 eax, edx

        $sequence_7 = { e8???????? 83c408 85c0 7422 83c702 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7422                 | je                  0x24
            //   83c702               | add                 edi, 2

        $sequence_8 = { 56 e8???????? 8bc6 83c418 8d5001 8a08 40 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   83c418               | add                 esp, 0x18
            //   8d5001               | lea                 edx, [eax + 1]
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   40                   | inc                 eax

        $sequence_9 = { ffd3 8b4dfc 8bf0 f7de }
            // n = 4, score = 100
            //   ffd3                 | call                ebx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8bf0                 | mov                 esi, eax
            //   f7de                 | neg                 esi

    condition:
        7 of them and filesize < 401408
}