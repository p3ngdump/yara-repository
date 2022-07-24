rule win_woolger_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.woolger."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.woolger"
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
        $sequence_0 = { 0f8c50020000 8b450c 3d00010000 740b 3d04010000 0f853b020000 }
            // n = 6, score = 200
            //   0f8c50020000         | jl                  0x256
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   3d00010000           | cmp                 eax, 0x100
            //   740b                 | je                  0xd
            //   3d04010000           | cmp                 eax, 0x104
            //   0f853b020000         | jne                 0x241

        $sequence_1 = { 0f84e6000000 3da5000000 0f84db000000 83f85b 0f84cb000000 }
            // n = 5, score = 200
            //   0f84e6000000         | je                  0xec
            //   3da5000000           | cmp                 eax, 0xa5
            //   0f84db000000         | je                  0xe1
            //   83f85b               | cmp                 eax, 0x5b
            //   0f84cb000000         | je                  0xd1

        $sequence_2 = { ffd7 68???????? 56 8985f4f4ffff ffd7 8dbdfcf8ffff 8985f8f4ffff }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   68????????           |                     
            //   56                   | push                esi
            //   8985f4f4ffff         | mov                 dword ptr [ebp - 0xb0c], eax
            //   ffd7                 | call                edi
            //   8dbdfcf8ffff         | lea                 edi, [ebp - 0x704]
            //   8985f8f4ffff         | mov                 dword ptr [ebp - 0xb08], eax

        $sequence_3 = { 84c0 75f8 b90b000000 be???????? f3a5 66a5 }
            // n = 6, score = 200
            //   84c0                 | test                al, al
            //   75f8                 | jne                 0xfffffffa
            //   b90b000000           | mov                 ecx, 0xb
            //   be????????           |                     
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]

        $sequence_4 = { 52 ff15???????? e8???????? bf???????? e8???????? bf???????? e8???????? }
            // n = 7, score = 200
            //   52                   | push                edx
            //   ff15????????         |                     
            //   e8????????           |                     
            //   bf????????           |                     
            //   e8????????           |                     
            //   bf????????           |                     
            //   e8????????           |                     

        $sequence_5 = { ff750c ff7508 ff15???????? 5d c3 33c0 }
            // n = 6, score = 200
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { 83f80a 750a be???????? e9???????? }
            // n = 4, score = 200
            //   83f80a               | cmp                 eax, 0xa
            //   750a                 | jne                 0xc
            //   be????????           |                     
            //   e9????????           |                     

        $sequence_7 = { e8???????? 8b07 83f808 750a }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   83f808               | cmp                 eax, 8
            //   750a                 | jne                 0xc

        $sequence_8 = { ffd6 2480 3c80 6a14 0f9485f5feffff }
            // n = 5, score = 200
            //   ffd6                 | call                esi
            //   2480                 | and                 al, 0x80
            //   3c80                 | cmp                 al, 0x80
            //   6a14                 | push                0x14
            //   0f9485f5feffff       | sete                byte ptr [ebp - 0x10b]

        $sequence_9 = { 66a5 8dbdfcf8ffff 4f 8a4701 }
            // n = 4, score = 200
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   8dbdfcf8ffff         | lea                 edi, [ebp - 0x704]
            //   4f                   | dec                 edi
            //   8a4701               | mov                 al, byte ptr [edi + 1]

    condition:
        7 of them and filesize < 196608
}