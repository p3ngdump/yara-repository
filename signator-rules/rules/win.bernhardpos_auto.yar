rule win_bernhardpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bernhardpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bernhardpos"
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
        $sequence_0 = { 894de4 8b45e4 c1e812 83e03f 8b4d0c 034df4 }
            // n = 6, score = 200
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   c1e812               | shr                 eax, 0x12
            //   83e03f               | and                 eax, 0x3f
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   034df4               | add                 ecx, dword ptr [ebp - 0xc]

        $sequence_1 = { 8b4d08 03483c 894df4 b808000000 }
            // n = 4, score = 200
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   03483c               | add                 ecx, dword ptr [eax + 0x3c]
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   b808000000           | mov                 eax, 8

        $sequence_2 = { 817dfcffffff6f 7407 33c0 e9???????? c745f800000000 eb09 8b45f8 }
            // n = 7, score = 200
            //   817dfcffffff6f       | cmp                 dword ptr [ebp - 4], 0x6fffffff
            //   7407                 | je                  9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   eb09                 | jmp                 0xb
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_3 = { 8b4508 0345fc 0fbe08 83f944 }
            // n = 4, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0345fc               | add                 eax, dword ptr [ebp - 4]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   83f944               | cmp                 ecx, 0x44

        $sequence_4 = { a3???????? 688f8062b0 a1???????? 50 e8???????? a3???????? 683df60df1 }
            // n = 7, score = 200
            //   a3????????           |                     
            //   688f8062b0           | push                0xb062808f
            //   a1????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   a3????????           |                     
            //   683df60df1           | push                0xf10df63d

        $sequence_5 = { 833d????????00 0f84b3000000 6a24 8d85c0fbffff 50 e8???????? 83c408 }
            // n = 7, score = 200
            //   833d????????00       |                     
            //   0f84b3000000         | je                  0xb9
            //   6a24                 | push                0x24
            //   8d85c0fbffff         | lea                 eax, [ebp - 0x440]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_6 = { 83e863 5f 5e 5b }
            // n = 4, score = 200
            //   83e863               | sub                 eax, 0x63
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_7 = { 8d85d0feffff 8985c8feffff 8d85c4feffff 50 6aff 68ff000000 }
            // n = 6, score = 200
            //   8d85d0feffff         | lea                 eax, [ebp - 0x130]
            //   8985c8feffff         | mov                 dword ptr [ebp - 0x138], eax
            //   8d85c4feffff         | lea                 eax, [ebp - 0x13c]
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   68ff000000           | push                0xff

        $sequence_8 = { e8???????? a3???????? 68a86b4aa0 a1???????? 50 e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   a3????????           |                     
            //   68a86b4aa0           | push                0xa04a6ba8
            //   a1????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { e8???????? 83c404 6a01 8d85d0feffff 50 ff15???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   6a01                 | push                1
            //   8d85d0feffff         | lea                 eax, [ebp - 0x130]
            //   50                   | push                eax
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 368640
}