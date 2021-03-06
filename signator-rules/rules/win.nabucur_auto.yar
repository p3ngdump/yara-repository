rule win_nabucur_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.nabucur."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nabucur"
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
        $sequence_0 = { 48 894500 85c0 7fee }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   894500               | mov                 dword ptr [ebp], eax
            //   85c0                 | test                eax, eax
            //   7fee                 | jg                  0xfffffff0

        $sequence_1 = { 48 89442414 85c0 7e11 0fbe07 }
            // n = 5, score = 200
            //   48                   | dec                 eax
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   85c0                 | test                eax, eax
            //   7e11                 | jle                 0x13
            //   0fbe07               | movsx               eax, byte ptr [edi]

        $sequence_2 = { 49 03d3 40 85c9 }
            // n = 4, score = 200
            //   49                   | dec                 ecx
            //   03d3                 | add                 edx, ebx
            //   40                   | inc                 eax
            //   85c9                 | test                ecx, ecx

        $sequence_3 = { 49 23ce 894f18 8bf0 85c0 0f8521040000 }
            // n = 6, score = 200
            //   49                   | dec                 ecx
            //   23ce                 | and                 ecx, esi
            //   894f18               | mov                 dword ptr [edi + 0x18], ecx
            //   8bf0                 | mov                 esi, eax
            //   85c0                 | test                eax, eax
            //   0f8521040000         | jne                 0x427

        $sequence_4 = { 49 23cb 894d08 5d }
            // n = 4, score = 200
            //   49                   | dec                 ecx
            //   23cb                 | and                 ecx, ebx
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   5d                   | pop                 ebp

        $sequence_5 = { 33ff 33f6 4a c744244001000000 89542434 }
            // n = 5, score = 200
            //   33ff                 | xor                 edi, edi
            //   33f6                 | xor                 esi, esi
            //   4a                   | dec                 edx
            //   c744244001000000     | mov                 dword ptr [esp + 0x40], 1
            //   89542434             | mov                 dword ptr [esp + 0x34], edx

        $sequence_6 = { 009eaa030000 0fb686aa030000 57 83f80a 0f876d010000 }
            // n = 5, score = 200
            //   009eaa030000         | add                 byte ptr [esi + 0x3aa], bl
            //   0fb686aa030000       | movzx               eax, byte ptr [esi + 0x3aa]
            //   57                   | push                edi
            //   83f80a               | cmp                 eax, 0xa
            //   0f876d010000         | ja                  0x173

        $sequence_7 = { 48 8944241c 85c0 7fd1 }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   85c0                 | test                eax, eax
            //   7fd1                 | jg                  0xffffffd3

        $sequence_8 = { a0???????? e6e6 ad b249 a4 }
            // n = 5, score = 100
            //   a0????????           |                     
            //   e6e6                 | out                 0xe6, al
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   b249                 | mov                 dl, 0x49
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]

        $sequence_9 = { 78cf 4c 3e9f 7d59 91 f3bb0cf67960 }
            // n = 6, score = 100
            //   78cf                 | js                  0xffffffd1
            //   4c                   | dec                 esp
            //   3e9f                 | lahf                
            //   7d59                 | jge                 0x5b
            //   91                   | xchg                eax, ecx
            //   f3bb0cf67960         | mov                 ebx, 0x6079f60c

        $sequence_10 = { 9d 0d0d1733bf 1824bd685887f7 b270 }
            // n = 4, score = 100
            //   9d                   | popfd               
            //   0d0d1733bf           | or                  eax, 0xbf33170d
            //   1824bd685887f7       | sbb                 byte ptr [edi*4 - 0x878a798], ah
            //   b270                 | mov                 dl, 0x70

        $sequence_11 = { 49 bb540fb7ff 83f901 7d1f }
            // n = 4, score = 100
            //   49                   | dec                 ecx
            //   bb540fb7ff           | mov                 ebx, 0xffb70f54
            //   83f901               | cmp                 ecx, 1
            //   7d1f                 | jge                 0x21

        $sequence_12 = { ba66e3b5fe 83c604 bbf9a83b00 eb00 }
            // n = 4, score = 100
            //   ba66e3b5fe           | mov                 edx, 0xfeb5e366
            //   83c604               | add                 esi, 4
            //   bbf9a83b00           | mov                 ebx, 0x3ba8f9
            //   eb00                 | jmp                 2

        $sequence_13 = { ee b346 bc6e64f67a 5b }
            // n = 4, score = 100
            //   ee                   | out                 dx, al
            //   b346                 | mov                 bl, 0x46
            //   bc6e64f67a           | mov                 esp, 0x7af6646e
            //   5b                   | pop                 ebx

        $sequence_14 = { 81f34b8db8fe ba17c1ca00 bb463cb9f8 ba3abee800 e8???????? 81f2e8c684fd }
            // n = 6, score = 100
            //   81f34b8db8fe         | xor                 ebx, 0xfeb88d4b
            //   ba17c1ca00           | mov                 edx, 0xcac117
            //   bb463cb9f8           | mov                 ebx, 0xf8b93c46
            //   ba3abee800           | mov                 edx, 0xe8be3a
            //   e8????????           |                     
            //   81f2e8c684fd         | xor                 edx, 0xfd84c6e8

        $sequence_15 = { 81f31ed75ef9 bab7a7dfff bb0c894cfb ce }
            // n = 4, score = 100
            //   81f31ed75ef9         | xor                 ebx, 0xf95ed71e
            //   bab7a7dfff           | mov                 edx, 0xffdfa7b7
            //   bb0c894cfb           | mov                 ebx, 0xfb4c890c
            //   ce                   | into                

    condition:
        7 of them and filesize < 1949696
}