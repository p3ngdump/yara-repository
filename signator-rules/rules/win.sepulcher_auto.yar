rule win_sepulcher_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.sepulcher."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sepulcher"
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
        $sequence_0 = { 740d 68744a0000 56 e8???????? 59 59 }
            // n = 6, score = 100
            //   740d                 | je                  0xf
            //   68744a0000           | push                0x4a74
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_1 = { 8d8424ce750000 89742410 56 50 e8???????? 83c40c 8dbc24c8750000 }
            // n = 7, score = 100
            //   8d8424ce750000       | lea                 eax, [esp + 0x75ce]
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8dbc24c8750000       | lea                 edi, [esp + 0x75c8]

        $sequence_2 = { 0f45c1 50 57 ff15???????? 81feee030000 751a 8b952cd2ffff }
            // n = 7, score = 100
            //   0f45c1               | cmovne              eax, ecx
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   81feee030000         | cmp                 esi, 0x3ee
            //   751a                 | jne                 0x1c
            //   8b952cd2ffff         | mov                 edx, dword ptr [ebp - 0x2dd4]

        $sequence_3 = { 8d3c9d7cdc0110 f00fb10f 8bc8 85c9 740b 8d4101 f7d8 }
            // n = 7, score = 100
            //   8d3c9d7cdc0110       | lea                 edi, [ebx*4 + 0x1001dc7c]
            //   f00fb10f             | lock cmpxchg        dword ptr [edi], ecx
            //   8bc8                 | mov                 ecx, eax
            //   85c9                 | test                ecx, ecx
            //   740b                 | je                  0xd
            //   8d4101               | lea                 eax, [ecx + 1]
            //   f7d8                 | neg                 eax

        $sequence_4 = { 89461c 83f808 74b9 83f807 77c4 ff2485a66f0010 8bce }
            // n = 7, score = 100
            //   89461c               | mov                 dword ptr [esi + 0x1c], eax
            //   83f808               | cmp                 eax, 8
            //   74b9                 | je                  0xffffffbb
            //   83f807               | cmp                 eax, 7
            //   77c4                 | ja                  0xffffffc6
            //   ff2485a66f0010       | jmp                 dword ptr [eax*4 + 0x10006fa6]
            //   8bce                 | mov                 ecx, esi

        $sequence_5 = { 57 8bce e8???????? 0fb7df }
            // n = 4, score = 100
            //   57                   | push                edi
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   0fb7df               | movzx               ebx, di

        $sequence_6 = { 7432 ba80000000 663bc2 7428 }
            // n = 4, score = 100
            //   7432                 | je                  0x34
            //   ba80000000           | mov                 edx, 0x80
            //   663bc2               | cmp                 ax, dx
            //   7428                 | je                  0x2a

        $sequence_7 = { ffd7 85c0 7413 ffb67c480000 6af5 ffd7 85c0 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15
            //   ffb67c480000         | push                dword ptr [esi + 0x487c]
            //   6af5                 | push                -0xb
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax

        $sequence_8 = { 898674480000 898678480000 89867c480000 898680480000 8d8684480000 }
            // n = 5, score = 100
            //   898674480000         | mov                 dword ptr [esi + 0x4874], eax
            //   898678480000         | mov                 dword ptr [esi + 0x4878], eax
            //   89867c480000         | mov                 dword ptr [esi + 0x487c], eax
            //   898680480000         | mov                 dword ptr [esi + 0x4880], eax
            //   8d8684480000         | lea                 eax, [esi + 0x4884]

        $sequence_9 = { 59 33c0 3903 0f8421ffffff 5f 5e 5b }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   3903                 | cmp                 dword ptr [ebx], eax
            //   0f8421ffffff         | je                  0xffffff27
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

    condition:
        7 of them and filesize < 279552
}