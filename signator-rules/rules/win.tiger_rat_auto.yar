rule win_tiger_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tiger_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tiger_rat"
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
        $sequence_0 = { 41b880000000 440fb60c3a 41d3f8 4522c8 }
            // n = 4, score = 200
            //   41b880000000         | mov                 eax, 0x75
            //   440fb60c3a           | dec                 eax
            //   41d3f8               | mov                 dword ptr [esp + 0x20], eax
            //   4522c8               | mov                 edx, dword ptr [esi + 8]

        $sequence_1 = { 412bc2 83c008 4863c8 e8???????? 4c8bc7 488bd5 }
            // n = 6, score = 200
            //   412bc2               | test                al, al
            //   83c008               | inc                 ecx
            //   4863c8               | mov                 eax, 0x75
            //   e8????????           |                     
            //   4c8bc7               | dec                 eax
            //   488bd5               | mov                 dword ptr [esp + 0x20], eax

        $sequence_2 = { 41b875000000 4889442420 e8???????? 8b5608 }
            // n = 4, score = 200
            //   41b875000000         | dec                 eax
            //   4889442420           | lea                 esi, [esi + 1]
            //   e8????????           |                     
            //   8b5608               | dec                 esp

        $sequence_3 = { 33c0 4c8d45c0 4533e4 8d5020 448965c0 488945c4 488945cc }
            // n = 7, score = 200
            //   33c0                 | dec                 eax
            //   4c8d45c0             | mov                 ecx, dword ptr [esi + 0x10]
            //   4533e4               | inc                 ecx
            //   8d5020               | mov                 eax, 0x75
            //   448965c0             | dec                 eax
            //   488945c4             | mov                 dword ptr [esp + 0x20], eax
            //   488945cc             | mov                 edx, dword ptr [esi + 8]

        $sequence_4 = { 4863d0 4803d1 e8???????? 488b5c2438 }
            // n = 4, score = 200
            //   4863d0               | dec                 eax
            //   4803d1               | mov                 ecx, dword ptr [esi + 0x10]
            //   e8????????           |                     
            //   488b5c2438           | xor                 eax, eax

        $sequence_5 = { 41b876000000 4889442420 e8???????? 8bc3 }
            // n = 4, score = 200
            //   41b876000000         | jne                 0x1e
            //   4889442420           | inc                 ecx
            //   e8????????           |                     
            //   8bc3                 | mov                 eax, 0x73

        $sequence_6 = { 33c0 89442438 89442430 448bcf }
            // n = 4, score = 200
            //   33c0                 | dec                 eax
            //   89442438             | mov                 ecx, dword ptr [esi + 0x10]
            //   89442430             | xor                 eax, eax
            //   448bcf               | inc                 ecx

        $sequence_7 = { 41b873000000 4889442420 e8???????? 488bd7 488bce e8???????? }
            // n = 6, score = 200
            //   41b873000000         | xor                 ecx, ecx
            //   4889442420           | dec                 eax
            //   e8????????           |                     
            //   488bd7               | lea                 edx, [0xe588]
            //   488bce               | dec                 eax
            //   e8????????           |                     

        $sequence_8 = { 0f84ef000000 8b05???????? 418b5ef4 418b7e04 2305???????? 33c9 }
            // n = 6, score = 100
            //   0f84ef000000         | dec                 eax
            //   8b05????????         |                     
            //   418b5ef4             | inc                 ecx
            //   418b7e04             | jne                 9
            //   2305????????         |                     
            //   33c9                 | jmp                 0x19

        $sequence_9 = { 48894d58 33c0 48ffc1 7502 eb10 4883f9ff }
            // n = 6, score = 100
            //   48894d58             | lea                 esi, [esi + 1]
            //   33c0                 | dec                 eax
            //   48ffc1               | cmove               ecx, eax
            //   7502                 | dec                 ecx
            //   eb10                 | dec                 eax
            //   4883f9ff             | jne                 0xffffffec

        $sequence_10 = { 488d1588e50000 ff15???????? 4885c0 7404 }
            // n = 4, score = 100
            //   488d1588e50000       | dec                 eax
            //   ff15????????         |                     
            //   4885c0               | cmp                 ecx, -1
            //   7404                 | inc                 ecx

        $sequence_11 = { 44890d???????? 3016 4883f90f 488d7601 }
            // n = 4, score = 100
            //   44890d????????       |                     
            //   3016                 | mov                 eax, 0x7d0
            //   4883f90f             | mov                 dword ptr [ebp - 9], 0x7b020840
            //   488d7601             | dec                 eax

        $sequence_12 = { 488bcf 48c1f905 83e21f 4c8d05fc690100 498b0cc8 }
            // n = 5, score = 100
            //   488bcf               | dec                 eax
            //   48c1f905             | mov                 ecx, edi
            //   83e21f               | dec                 eax
            //   4c8d05fc690100       | sar                 ecx, 5
            //   498b0cc8             | and                 edx, 0x1f

        $sequence_13 = { 41b8d0070000 c745f74008027b 890d???????? 488bce 488bf8 c745fb0f46210d c745ff502c5e00 }
            // n = 7, score = 100
            //   41b8d0070000         | mov                 eax, ebx
            //   c745f74008027b       | dec                 eax
            //   890d????????         |                     
            //   488bce               | mov                 ebx, dword ptr [esp + 0x40]
            //   488bf8               | dec                 eax
            //   c745fb0f46210d       | mov                 dword ptr [ebp + 0x58], ecx
            //   c745ff502c5e00       | xor                 eax, eax

        $sequence_14 = { 4c8bf3 ff15???????? c705????????4b000000 488be8 4885c0 7513 }
            // n = 6, score = 100
            //   4c8bf3               | mov                 ecx, esi
            //   ff15????????         |                     
            //   c705????????4b000000     |     
            //   488be8               | dec                 eax
            //   4885c0               | mov                 edi, eax
            //   7513                 | mov                 dword ptr [ebp - 5], 0xd21460f

        $sequence_15 = { 4883f90f 488d7601 480f44c8 49ffc8 75df 8bc3 488b5c2440 }
            // n = 7, score = 100
            //   4883f90f             | dec                 esp
            //   488d7601             | lea                 eax, [0x169fc]
            //   480f44c8             | dec                 ecx
            //   49ffc8               | mov                 ecx, dword ptr [eax + ecx*8]
            //   75df                 | dec                 eax
            //   8bc3                 | cmp                 ecx, 0xf
            //   488b5c2440           | dec                 eax

    condition:
        7 of them and filesize < 557056
}