rule win_hookinjex_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.hookinjex."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hookinjex"
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
        $sequence_0 = { e8???????? 85c0 750a 4885ff }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | mov                 eax, ebx
            //   750a                 | test                eax, eax
            //   4885ff               | je                  0x11

        $sequence_1 = { e8???????? 833d????????00 7411 b906000000 e8???????? 488905???????? }
            // n = 6, score = 300
            //   e8????????           |                     
            //   833d????????00       |                     
            //   7411                 | je                  0x11
            //   b906000000           | mov                 ecx, 0xe58c
            //   e8????????           |                     
            //   488905????????       |                     

        $sequence_2 = { e8???????? 85c0 740c b913e40000 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | jne                 0x11
            //   740c                 | mov                 ecx, 0x155dc
            //   b913e40000           | test                eax, eax

        $sequence_3 = { e8???????? 8bc7 488b8c24d0000000 4833cc e8???????? }
            // n = 5, score = 300
            //   e8????????           |                     
            //   8bc7                 | mov                 eax, edi
            //   488b8c24d0000000     | dec                 eax
            //   4833cc               | mov                 ecx, dword ptr [esp + 0xd0]
            //   e8????????           |                     

        $sequence_4 = { e8???????? 85c0 740f b907b60000 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   740f                 | xor                 ecx, esp
            //   b907b60000           | test                eax, eax

        $sequence_5 = { e8???????? 85c0 7408 803b00 7403 48ffc3 488bc3 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   85c0                 | je                  0x11
            //   7408                 | mov                 ecx, 0xb607
            //   803b00               | test                eax, eax
            //   7403                 | je                  0xa
            //   48ffc3               | cmp                 byte ptr [ebx], 0
            //   488bc3               | je                  5

        $sequence_6 = { e8???????? 85c0 7507 b80e000000 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7507                 | je                  0x13
            //   b80e000000           | mov                 ecx, 0xe58c

        $sequence_7 = { e8???????? 85c0 750f b9559b0100 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | je                  0x11
            //   750f                 | mov                 ecx, 0xb607
            //   b9559b0100           | test                eax, eax

        $sequence_8 = { 25001b0000 3d00110000 750a c744245c01000000 }
            // n = 4, score = 200
            //   25001b0000           | and                 eax, 0x1b00
            //   3d00110000           | cmp                 eax, 0x1100
            //   750a                 | jne                 0xc
            //   c744245c01000000     | mov                 dword ptr [esp + 0x5c], 1

        $sequence_9 = { 25001b0000 3d00120000 750d c784245401000001000000 }
            // n = 4, score = 200
            //   25001b0000           | and                 eax, 0x1b00
            //   3d00120000           | cmp                 eax, 0x1200
            //   750d                 | jne                 0xf
            //   c784245401000001000000     | mov    dword ptr [esp + 0x154], 1

        $sequence_10 = { 25001b0000 3d00110000 750d c784243c01000001000000 }
            // n = 4, score = 200
            //   25001b0000           | and                 eax, 0x1b00
            //   3d00110000           | cmp                 eax, 0x1100
            //   750d                 | jne                 0xf
            //   c784243c01000001000000     | mov    dword ptr [esp + 0x13c], 1

        $sequence_11 = { 2500180000 3d00080000 750d c784242802000001000000 eb0b }
            // n = 5, score = 200
            //   2500180000           | and                 eax, 0x1800
            //   3d00080000           | cmp                 eax, 0x800
            //   750d                 | jne                 0xf
            //   c784242802000001000000     | mov    dword ptr [esp + 0x228], 1
            //   eb0b                 | jmp                 0xd

        $sequence_12 = { 25001b0000 3d00120000 750a c744246401000000 }
            // n = 4, score = 200
            //   25001b0000           | and                 eax, 0x1b00
            //   3d00120000           | cmp                 eax, 0x1200
            //   750a                 | jne                 0xc
            //   c744246401000000     | mov                 dword ptr [esp + 0x64], 1

        $sequence_13 = { 25001b0000 3d00100000 750d c784242401000001000000 }
            // n = 4, score = 200
            //   25001b0000           | and                 eax, 0x1b00
            //   3d00100000           | cmp                 eax, 0x1000
            //   750d                 | jne                 0xf
            //   c784242401000001000000     | mov    dword ptr [esp + 0x124], 1

        $sequence_14 = { 25001b0000 3d00100000 750a c744244401000000 }
            // n = 4, score = 200
            //   25001b0000           | and                 eax, 0x1b00
            //   3d00100000           | cmp                 eax, 0x1000
            //   750a                 | jne                 0xc
            //   c744244401000000     | mov                 dword ptr [esp + 0x44], 1

        $sequence_15 = { 2500180000 3d00180000 750a c744247c01000000 }
            // n = 4, score = 200
            //   2500180000           | and                 eax, 0x1800
            //   3d00180000           | cmp                 eax, 0x1800
            //   750a                 | jne                 0xc
            //   c744247c01000000     | mov                 dword ptr [esp + 0x7c], 1

    condition:
        7 of them and filesize < 6545408
}