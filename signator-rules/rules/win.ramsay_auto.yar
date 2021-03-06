rule win_ramsay_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ramsay."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ramsay"
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
        $sequence_0 = { ff15???????? 85c0 7502 eb02 ebb1 }
            // n = 5, score = 600
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7502                 | jne                 4
            //   eb02                 | jmp                 4
            //   ebb1                 | jmp                 0xffffffb3

        $sequence_1 = { 85c0 7514 ff15???????? 83f820 7502 }
            // n = 5, score = 600
            //   85c0                 | test                eax, eax
            //   7514                 | jne                 0x16
            //   ff15????????         |                     
            //   83f820               | cmp                 eax, 0x20
            //   7502                 | jne                 4

        $sequence_2 = { 83f820 7502 eb07 33c0 e9???????? }
            // n = 5, score = 600
            //   83f820               | cmp                 eax, 0x20
            //   7502                 | jne                 4
            //   eb07                 | jmp                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     

        $sequence_3 = { 6a00 6a00 ff15???????? 8b4d0c 8901 33c9 8b550c }
            // n = 7, score = 500
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   33c9                 | xor                 ecx, ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]

        $sequence_4 = { 884df5 c745ec00000000 6a06 8d55f0 }
            // n = 4, score = 500
            //   884df5               | mov                 byte ptr [ebp - 0xb], cl
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   6a06                 | push                6
            //   8d55f0               | lea                 edx, [ebp - 0x10]

        $sequence_5 = { 83c40c 8b4d0c 8b11 52 8b45fc 50 }
            // n = 6, score = 500
            //   83c40c               | add                 esp, 0xc
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   52                   | push                edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_6 = { 8945fc 8b4dfc 3b4d08 732c }
            // n = 4, score = 500
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   3b4d08               | cmp                 ecx, dword ptr [ebp + 8]
            //   732c                 | jae                 0x2e

        $sequence_7 = { e8???????? 83c404 8945f8 8b4d08 83c101 51 }
            // n = 6, score = 500
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   83c101               | add                 ecx, 1
            //   51                   | push                ecx

        $sequence_8 = { 8a4806 884a1c 8b5508 8b4508 8a4808 }
            // n = 5, score = 500
            //   8a4806               | mov                 cl, byte ptr [eax + 6]
            //   884a1c               | mov                 byte ptr [edx + 0x1c], cl
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4808               | mov                 cl, byte ptr [eax + 8]

        $sequence_9 = { 8b4508 8a481e 884a03 8b5508 }
            // n = 4, score = 500
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a481e               | mov                 cl, byte ptr [eax + 0x1e]
            //   884a03               | mov                 byte ptr [edx + 3], cl
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]

        $sequence_10 = { ff15???????? 85c0 751a 8b4df8 51 ff15???????? }
            // n = 6, score = 500
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   751a                 | jne                 0x1c
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_11 = { ff15???????? 33c0 e9???????? e8???????? 85c0 7507 }
            // n = 6, score = 400
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9

        $sequence_12 = { e8???????? cc 488d4b04 4c8d0550810000 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   cc                   | mov                 dword ptr [esp + 0x18], ebx
            //   488d4b04             | dec                 eax
            //   4c8d0550810000       | mov                 dword ptr [esp + 0x20], ebp

        $sequence_13 = { e8???????? cc b201 488bcf e8???????? 4c8d1dfb260100 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   cc                   | dec                 esp
            //   b201                 | lea                 eax, [0x15fa0]
            //   488bcf               | dec                 ecx
            //   e8????????           |                     
            //   4c8d1dfb260100       | mov                 edx, esp

        $sequence_14 = { e8???????? cc 48895c2418 48896c2420 56 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   cc                   | int3                
            //   48895c2418           | dec                 eax
            //   48896c2420           | mov                 dword ptr [esp + 0x18], ebx
            //   56                   | dec                 eax

        $sequence_15 = { e8???????? cc 4c8d05a05f0100 498bd4 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   cc                   | lea                 eax, [0x8150]
            //   4c8d05a05f0100       | mov                 edx, 0x16
            //   498bd4               | int3                

    condition:
        7 of them and filesize < 2031616
}