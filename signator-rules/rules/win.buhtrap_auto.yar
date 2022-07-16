rule win_buhtrap_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.buhtrap."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buhtrap"
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
        $sequence_0 = { e8???????? 59 59 84c0 0f8435010000 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   0f8435010000         | je                  0x13b

        $sequence_1 = { 59 56 ff15???????? 57 ff15???????? 85db }
            // n = 6, score = 400
            //   59                   | pop                 ecx
            //   56                   | push                esi
            //   ff15????????         |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85db                 | test                ebx, ebx

        $sequence_2 = { 46 743e 8b06 3b01 7538 }
            // n = 5, score = 400
            //   46                   | inc                 esi
            //   743e                 | je                  0x40
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   3b01                 | cmp                 eax, dword ptr [ecx]
            //   7538                 | jne                 0x3a

        $sequence_3 = { 8d45f0 68???????? 50 c745f06c524000 }
            // n = 4, score = 400
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   68????????           |                     
            //   50                   | push                eax
            //   c745f06c524000       | mov                 dword ptr [ebp - 0x10], 0x40526c

        $sequence_4 = { 8bec 8b4508 56 8bf2 85c0 }
            // n = 5, score = 400
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   56                   | push                esi
            //   8bf2                 | mov                 esi, edx
            //   85c0                 | test                eax, eax

        $sequence_5 = { 6a18 5a b9???????? 8945cc e8???????? 6a10 5a }
            // n = 7, score = 400
            //   6a18                 | push                0x18
            //   5a                   | pop                 edx
            //   b9????????           |                     
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   e8????????           |                     
            //   6a10                 | push                0x10
            //   5a                   | pop                 edx

        $sequence_6 = { 8b55fc 85d2 0f85fffeffff eb03 8b55fc 8b0a 52 }
            // n = 7, score = 400
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   85d2                 | test                edx, edx
            //   0f85fffeffff         | jne                 0xffffff05
            //   eb03                 | jmp                 5
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   52                   | push                edx

        $sequence_7 = { 53 56 57 6802010000 33db 8955fc 8d85ecfeffff }
            // n = 7, score = 400
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   6802010000           | push                0x102
            //   33db                 | xor                 ebx, ebx
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   8d85ecfeffff         | lea                 eax, [ebp - 0x114]

        $sequence_8 = { 7463 8d4601 50 e8???????? 59 8945fc }
            // n = 6, score = 100
            //   7463                 | je                  0x65
            //   8d4601               | lea                 eax, [esi + 1]
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_9 = { c6041f00 897df8 eb09 53 e8???????? 59 }
            // n = 6, score = 100
            //   c6041f00             | mov                 byte ptr [edi + ebx], 0
            //   897df8               | mov                 dword ptr [ebp - 8], edi
            //   eb09                 | jmp                 0xb
            //   53                   | push                ebx
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_10 = { 8d4730 50 c645ff01 e8???????? 57 }
            // n = 5, score = 100
            //   8d4730               | lea                 eax, [edi + 0x30]
            //   50                   | push                eax
            //   c645ff01             | mov                 byte ptr [ebp - 1], 1
            //   e8????????           |                     
            //   57                   | push                edi

        $sequence_11 = { 85c0 7404 6a0d eb17 6a01 }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   6a0d                 | push                0xd
            //   eb17                 | jmp                 0x19
            //   6a01                 | push                1

        $sequence_12 = { 6a14 68???????? e8???????? ff7500 }
            // n = 4, score = 100
            //   6a14                 | push                0x14
            //   68????????           |                     
            //   e8????????           |                     
            //   ff7500               | push                dword ptr [ebp]

        $sequence_13 = { 03f9 eb08 49 807fff5c }
            // n = 4, score = 100
            //   03f9                 | add                 edi, ecx
            //   eb08                 | jmp                 0xa
            //   49                   | dec                 ecx
            //   807fff5c             | cmp                 byte ptr [edi - 1], 0x5c

        $sequence_14 = { 23c1 3bc8 7403 0345f8 85c0 741c }
            // n = 6, score = 100
            //   23c1                 | and                 eax, ecx
            //   3bc8                 | cmp                 ecx, eax
            //   7403                 | je                  5
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   85c0                 | test                eax, eax
            //   741c                 | je                  0x1e

    condition:
        7 of them and filesize < 131072
}