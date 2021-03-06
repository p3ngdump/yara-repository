rule win_unidentified_091_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.unidentified_091."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_091"
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
        $sequence_0 = { e8???????? 33c0 e9???????? 488b442440 488b7c2438 48898320050000 83bb8400000002 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   33c0                 | mov                 dword ptr [esi], eax
            //   e9????????           |                     
            //   488b442440           | je                  0xf20
            //   488b7c2438           | dec                 esi
            //   48898320050000       | lea                 ebx, [ebx + ecx]
            //   83bb8400000002       | inc                 ecx

        $sequence_1 = { e9???????? 4c89742440 48c74424480f000000 c644243000 41b802000000 488d1574f32300 488d4c2430 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   4c89742440           | dec                 ecx
            //   48c74424480f000000     | mov    edx, ebp
            //   c644243000           | dec                 ecx
            //   41b802000000         | mov                 ecx, esi
            //   488d1574f32300       | cmp                 ecx, 1
            //   488d4c2430           | ja                  0x174e

        $sequence_2 = { e8???????? 488b8d68070000 4c8b91b8030000 4d85d2 0f8490000000 8d43fd 83f803 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488b8d68070000       | lea                 eax, [eax + 0x41]
            //   4c8b91b8030000       | lea                 ecx, [eax + 3]
            //   4d85d2               | jne                 0x595
            //   0f8490000000         | dec                 esp
            //   8d43fd               | lea                 ecx, [0xd41db]
            //   83f803               | mov                 dword ptr [esp + 0x20], 0xe9

        $sequence_3 = { eb08 488bcb e8???????? 488bce e8???????? 4885ed 0f8470fdffff }
            // n = 7, score = 100
            //   eb08                 | je                  0xffffff25
            //   488bcb               | dec                 eax
            //   e8????????           |                     
            //   488bce               | lea                 edx, [0xfe03a]
            //   e8????????           |                     
            //   4885ed               | dec                 eax
            //   0f8470fdffff         | mov                 ecx, edi

        $sequence_4 = { ff15???????? 85c0 754d 41b865040000 488d153bd80f00 488bce e8???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   85c0                 | inc                 ecx
            //   754d                 | ror                 edi, 7
            //   41b865040000         | xor                 eax, dword ptr [ecx + 0xc]
            //   488d153bd80f00       | inc                 ebp
            //   488bce               | xor                 edi, ebx
            //   e8????????           |                     

        $sequence_5 = { ff542440 4c8b7c2448 4533ed 418bc5 4983ff40 0f82a0000000 498bcf }
            // n = 7, score = 100
            //   ff542440             | mov                 dword ptr [esp + 0x84], eax
            //   4c8b7c2448           | mov                 dword ptr [esp + 0x7c], eax
            //   4533ed               | dec                 esp
            //   418bc5               | lea                 eax, [ebp - 0x80]
            //   4983ff40             | dec                 eax
            //   0f82a0000000         | mov                 ecx, ebx
            //   498bcf               | dec                 eax

        $sequence_6 = { e8???????? 498bcd e8???????? 418bc7 488b8c24a0000000 4833cc e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   498bcd               | cmp                 eax, 0x10000
            //   e8????????           |                     
            //   418bc7               | je                  0xe00
            //   488b8c24a0000000     | dec                 eax
            //   4833cc               | lea                 ecx, [ebx + 0x830]
            //   e8????????           |                     

        $sequence_7 = { e9???????? 83fe0d 0f8596010000 488bcd e8???????? f2410f1006 f20f1100 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   83fe0d               | cmp                 edx, 8
            //   0f8596010000         | jge                 0x40c
            //   488bcd               | dec                 eax
            //   e8????????           |                     
            //   f2410f1006           | arpl                dx, ax
            //   f20f1100             | inc                 esp

        $sequence_8 = { e8???????? 488bcf 4889442430 e8???????? 488bcf 4889442448 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488bcf               | mov                 eax, dword ptr [esp + 0x68]
            //   4889442430           | inc                 ecx
            //   e8????????           |                     
            //   488bcf               | mov                 cl, 1
            //   4889442448           | mov                 cl, byte ptr [eax]
            //   e8????????           |                     

        $sequence_9 = { c7442428ac060000 448d4ab6 e9???????? 4863f8 4883ff40 7616 ba50000000 }
            // n = 7, score = 100
            //   c7442428ac060000     | dec                 eax
            //   448d4ab6             | mov                 ecx, ebx
            //   e9????????           |                     
            //   4863f8               | mov                 eax, dword ptr [ebx + 0x98]
            //   4883ff40             | je                  0x896
            //   7616                 | dec                 eax
            //   ba50000000           | arpl                word ptr [edi], dx

    condition:
        7 of them and filesize < 5777408
}