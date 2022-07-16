rule win_stealbit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.stealbit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stealbit"
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
        $sequence_0 = { 8d4df4 e8???????? 8bc8 e8???????? 3d45e9e4b8 740b }
            // n = 6, score = 300
            //   8d4df4               | lea                 ecx, [ebp - 0xc]
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   3d45e9e4b8           | cmp                 eax, 0xb8e4e945
            //   740b                 | je                  0xd

        $sequence_1 = { 0f846c020000 57 8d9520feffff 8bce e8???????? 59 85c0 }
            // n = 7, score = 300
            //   0f846c020000         | je                  0x272
            //   57                   | push                edi
            //   8d9520feffff         | lea                 edx, [ebp - 0x1e0]
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_2 = { c3 53 56 57 bfc59d1c81 8bf1 }
            // n = 6, score = 300
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   bfc59d1c81           | mov                 edi, 0x811c9dc5
            //   8bf1                 | mov                 esi, ecx

        $sequence_3 = { 53 56 57 8bf9 33db 6a08 53 }
            // n = 7, score = 300
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   33db                 | xor                 ebx, ebx
            //   6a08                 | push                8
            //   53                   | push                ebx

        $sequence_4 = { 0f8410020000 57 8d95f0fdffff 8bce }
            // n = 4, score = 300
            //   0f8410020000         | je                  0x216
            //   57                   | push                edi
            //   8d95f0fdffff         | lea                 edx, [ebp - 0x210]
            //   8bce                 | mov                 ecx, esi

        $sequence_5 = { 7f1b 7c07 8b4620 3b07 7312 }
            // n = 5, score = 300
            //   7f1b                 | jg                  0x1d
            //   7c07                 | jl                  9
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   3b07                 | cmp                 eax, dword ptr [edi]
            //   7312                 | jae                 0x14

        $sequence_6 = { 59 85c0 0f840d030000 57 8d9574feffff 8bce }
            // n = 6, score = 300
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   0f840d030000         | je                  0x313
            //   57                   | push                edi
            //   8d9574feffff         | lea                 edx, [ebp - 0x18c]
            //   8bce                 | mov                 ecx, esi

        $sequence_7 = { 89dc 81f9be345ad9 5a 59 0f85e4000000 0fbae219 }
            // n = 6, score = 300
            //   89dc                 | mov                 esp, ebx
            //   81f9be345ad9         | cmp                 ecx, 0xd95a34be
            //   5a                   | pop                 edx
            //   59                   | pop                 ecx
            //   0f85e4000000         | jne                 0xea
            //   0fbae219             | bt                  edx, 0x19

        $sequence_8 = { 8d4fe0 50 e8???????? 8947f8 59 83f8ff 7424 }
            // n = 7, score = 300
            //   8d4fe0               | lea                 ecx, [edi - 0x20]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8947f8               | mov                 dword ptr [edi - 8], eax
            //   59                   | pop                 ecx
            //   83f8ff               | cmp                 eax, -1
            //   7424                 | je                  0x26

        $sequence_9 = { 53 8b5d08 56 57 8bfa 8bf1 8d53fd }
            // n = 7, score = 300
            //   53                   | push                ebx
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bfa                 | mov                 edi, edx
            //   8bf1                 | mov                 esi, ecx
            //   8d53fd               | lea                 edx, [ebx - 3]

    condition:
        7 of them and filesize < 131072
}