rule win_powershellrunner_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.powershellrunner."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.powershellrunner"
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
        $sequence_0 = { c705????????01000000 b808000000 486bc000 488d0dda450200 8b542430 48891401 488d0d635b0100 }
            // n = 7, score = 200
            //   c705????????01000000     |     
            //   b808000000           | mov                 dword ptr [esp + 8], ecx
            //   486bc000             | dec                 eax
            //   488d0dda450200       | sub                 esp, 0x38
            //   8b542430             | dec                 eax
            //   48891401             | mov                 eax, dword ptr [esp + 0x58]
            //   488d0d635b0100       | dec                 eax

        $sequence_1 = { c74424200e000000 e9???????? 488b4c2430 ff15???????? 488b442430 488d0ddc990200 488b7810 }
            // n = 7, score = 200
            //   c74424200e000000     | dec                 esp
            //   e9????????           |                     
            //   488b4c2430           | mov                 eax, dword ptr [esp + 0x58]
            //   ff15????????         |                     
            //   488b442430           | dec                 eax
            //   488d0ddc990200       | mov                 edx, dword ptr [esp + 0x50]
            //   488b7810             | dec                 eax

        $sequence_2 = { 6689842474010000 b83b000000 6689842476010000 b824000000 6689842478010000 }
            // n = 5, score = 200
            //   6689842474010000     | mov                 dword ptr [esp + 0x20], 1
            //   b83b000000           | jmp                 0x344
            //   6689842476010000     | dec                 eax
            //   b824000000           | mov                 ecx, dword ptr [esp + 0x28]
            //   6689842478010000     | dec                 eax

        $sequence_3 = { c684249802000027 c68424990200001c c684249a02000033 c684249b02000067 c684249c02000055 c68424a002000007 c68424a102000025 }
            // n = 7, score = 200
            //   c684249802000027     | mov                 dword ptr [esp + 0x28], eax
            //   c68424990200001c     | dec                 eax
            //   c684249a02000033     | mov                 ecx, dword ptr [esp + 0x30]
            //   c684249b02000067     | mov                 eax, dword ptr [eax]
            //   c684249c02000055     | mov                 dword ptr [esp + 0x20], eax
            //   c68424a002000007     | dec                 esp
            //   c68424a102000025     | mov                 eax, dword ptr [esp + 0x50]

        $sequence_4 = { 4488442418 4889542410 48894c2408 57 4883ec30 488d442420 }
            // n = 6, score = 200
            //   4488442418           | mov                 dword ptr [esp + 8], ecx
            //   4889542410           | push                edi
            //   48894c2408           | dec                 eax
            //   57                   | sub                 esp, 0x2c0
            //   4883ec30             | dec                 eax
            //   488d442420           | mov                 dword ptr [esp + 0x50], 0xfffffffe

        $sequence_5 = { e8???????? 4885c0 7509 488d05979c0100 eb04 4883c020 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   4885c0               | lea                 edx, [ebx + 8]
            //   7509                 | xor                 ecx, ecx
            //   488d05979c0100       | dec                 eax
            //   eb04                 | mov                 dword ptr [edx], ecx
            //   4883c020             | dec                 eax

        $sequence_6 = { 488b4c2420 ff15???????? 33c0 e9???????? 488b0d???????? ff15???????? 488d542430 }
            // n = 7, score = 200
            //   488b4c2420           | mov                 eax, dword ptr [esp + 0x98]
            //   ff15????????         |                     
            //   33c0                 | dec                 eax
            //   e9????????           |                     
            //   488b0d????????       |                     
            //   ff15????????         |                     
            //   488d542430           | mov                 edx, dword ptr [esp + 0x28]

        $sequence_7 = { 41b803000000 488d158ac70000 488bcf e8???????? 85c0 }
            // n = 5, score = 200
            //   41b803000000         | mov                 ecx, edx
            //   488d158ac70000       | dec                 eax
            //   488bcf               | cmp                 dword ptr [eax], 0
            //   e8????????           |                     
            //   85c0                 | je                  0x471

        $sequence_8 = { c684249200000079 c684249300000044 c684249400000065 c684249500000073 c684249600000063 c684249700000072 c684249800000069 }
            // n = 7, score = 200
            //   c684249200000079     | dec                 eax
            //   c684249300000044     | lea                 ecx, [esp + 0x70]
            //   c684249400000065     | dec                 eax
            //   c684249500000073     | mov                 dword ptr [esp + 0x28], eax
            //   c684249600000063     | dec                 eax
            //   c684249700000072     | cmp                 dword ptr [esp + 0x28], 0
            //   c684249800000069     | dec                 eax

        $sequence_9 = { c684246801000011 c684246901000030 c684246a01000039 c684246b01000030 c684246c01000021 c684246d01000030 }
            // n = 6, score = 200
            //   c684246801000011     | dec                 eax
            //   c684246901000030     | lea                 ecx, [esp + 0x30]
            //   c684246a01000039     | dec                 eax
            //   c684246b01000030     | mov                 ecx, dword ptr [esp + 0x58]
            //   c684246c01000021     | nop                 
            //   c684246d01000030     | dec                 eax

    condition:
        7 of them and filesize < 458752
}