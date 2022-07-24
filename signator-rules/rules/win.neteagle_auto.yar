rule win_neteagle_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.neteagle."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neteagle"
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
        $sequence_0 = { 47 83c504 83ff0a 7cc5 33ff 8d6c241c }
            // n = 6, score = 100
            //   47                   | inc                 edi
            //   83c504               | add                 ebp, 4
            //   83ff0a               | cmp                 edi, 0xa
            //   7cc5                 | jl                  0xffffffc7
            //   33ff                 | xor                 edi, edi
            //   8d6c241c             | lea                 ebp, [esp + 0x1c]

        $sequence_1 = { 751c 8b4e10 6a00 8d44240c 6a04 50 51 }
            // n = 7, score = 100
            //   751c                 | jne                 0x1e
            //   8b4e10               | mov                 ecx, dword ptr [esi + 0x10]
            //   6a00                 | push                0
            //   8d44240c             | lea                 eax, [esp + 0xc]
            //   6a04                 | push                4
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_2 = { 85c0 0f85b4000000 8d4c242c e8???????? 85c0 0f85a3000000 8d442458 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f85b4000000         | jne                 0xba
            //   8d4c242c             | lea                 ecx, [esp + 0x2c]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f85a3000000         | jne                 0xa9
            //   8d442458             | lea                 eax, [esp + 0x58]

        $sequence_3 = { 0f85a3000000 8d442458 50 8b86040c0000 8d0c40 8d4cce08 e8???????? }
            // n = 7, score = 100
            //   0f85a3000000         | jne                 0xa9
            //   8d442458             | lea                 eax, [esp + 0x58]
            //   50                   | push                eax
            //   8b86040c0000         | mov                 eax, dword ptr [esi + 0xc04]
            //   8d0c40               | lea                 ecx, [eax + eax*2]
            //   8d4cce08             | lea                 ecx, [esi + ecx*8 + 8]
            //   e8????????           |                     

        $sequence_4 = { 8d4c2430 8be8 ff5240 85c0 0f84b3000000 8d4c242c e8???????? }
            // n = 7, score = 100
            //   8d4c2430             | lea                 ecx, [esp + 0x30]
            //   8be8                 | mov                 ebp, eax
            //   ff5240               | call                dword ptr [edx + 0x40]
            //   85c0                 | test                eax, eax
            //   0f84b3000000         | je                  0xb9
            //   8d4c242c             | lea                 ecx, [esp + 0x2c]
            //   e8????????           |                     

        $sequence_5 = { e8???????? 83c42c a3???????? e9???????? 83f80b 0f853b010000 8b5224 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c42c               | add                 esp, 0x2c
            //   a3????????           |                     
            //   e9????????           |                     
            //   83f80b               | cmp                 eax, 0xb
            //   0f853b010000         | jne                 0x141
            //   8b5224               | mov                 edx, dword ptr [edx + 0x24]

        $sequence_6 = { 89642424 52 e8???????? 8d442420 50 e8???????? 83c408 }
            // n = 7, score = 100
            //   89642424             | mov                 dword ptr [esp + 0x24], esp
            //   52                   | push                edx
            //   e8????????           |                     
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_7 = { e8???????? 85c0 7414 8b4610 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7414                 | je                  0x16
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]

        $sequence_8 = { 7406 8b11 6a01 ff12 8bce c7442410ffffffff e8???????? }
            // n = 7, score = 100
            //   7406                 | je                  8
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   6a01                 | push                1
            //   ff12                 | call                dword ptr [edx]
            //   8bce                 | mov                 ecx, esi
            //   c7442410ffffffff     | mov                 dword ptr [esp + 0x10], 0xffffffff
            //   e8????????           |                     

        $sequence_9 = { 83e103 f3a4 8b442414 8d4c2410 50 e8???????? }
            // n = 6, score = 100
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 262144
}