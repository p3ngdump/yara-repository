rule win_mimikatz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.mimikatz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mimikatz"
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
        $sequence_0 = { 83f8ff 750e ff15???????? c7002a000000 }
            // n = 4, score = 300
            //   83f8ff               | cmp                 eax, -1
            //   750e                 | jne                 0x10
            //   ff15????????         |                     
            //   c7002a000000         | mov                 dword ptr [eax], 0x2a

        $sequence_1 = { f7f1 85d2 7406 2bca }
            // n = 4, score = 300
            //   f7f1                 | div                 ecx
            //   85d2                 | test                edx, edx
            //   7406                 | je                  8
            //   2bca                 | sub                 ecx, edx

        $sequence_2 = { f30f6f4118 f30f7f842488000000 f30f6f4928 f30f7f8c24a0000000 }
            // n = 4, score = 200
            //   f30f6f4118           | movdqu              xmm0, xmmword ptr [ecx + 0x18]
            //   f30f7f842488000000     | movdqu    xmmword ptr [esp + 0x88], xmm0
            //   f30f6f4928           | movdqu              xmm1, xmmword ptr [ecx + 0x28]
            //   f30f7f8c24a0000000     | movdqu    xmmword ptr [esp + 0xa0], xmm1

        $sequence_3 = { 83f812 72f1 33c0 c3 }
            // n = 4, score = 200
            //   83f812               | cmp                 eax, 0x12
            //   72f1                 | jb                  0xfffffff3
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 

        $sequence_4 = { 3c02 7207 e8???????? eb10 }
            // n = 4, score = 200
            //   3c02                 | cmp                 al, 2
            //   7207                 | jb                  9
            //   e8????????           |                     
            //   eb10                 | jmp                 0x12

        $sequence_5 = { 6683f83f 7607 32c0 e9???????? }
            // n = 4, score = 200
            //   6683f83f             | cmp                 ax, 0x3f
            //   7607                 | jbe                 9
            //   32c0                 | xor                 al, al
            //   e9????????           |                     

        $sequence_6 = { e8???????? baa8000000 8d4a98 ff15???????? }
            // n = 4, score = 200
            //   e8????????           |                     
            //   baa8000000           | mov                 edx, 0xa8
            //   8d4a98               | lea                 ecx, [edx - 0x68]
            //   ff15????????         |                     

        $sequence_7 = { c3 81f998000000 7410 81f996000000 7408 81f99b000000 }
            // n = 6, score = 200
            //   c3                   | ret                 
            //   81f998000000         | cmp                 ecx, 0x98
            //   7410                 | je                  0x12
            //   81f996000000         | cmp                 ecx, 0x96
            //   7408                 | je                  0xa
            //   81f99b000000         | cmp                 ecx, 0x9b

        $sequence_8 = { 2bc1 85c9 7403 83c008 }
            // n = 4, score = 200
            //   2bc1                 | sub                 eax, ecx
            //   85c9                 | test                ecx, ecx
            //   7403                 | je                  5
            //   83c008               | add                 eax, 8

        $sequence_9 = { 66894108 33c0 39410c 740b }
            // n = 4, score = 200
            //   66894108             | mov                 word ptr [ecx + 8], ax
            //   33c0                 | xor                 eax, eax
            //   39410c               | cmp                 dword ptr [ecx + 0xc], eax
            //   740b                 | je                  0xd

        $sequence_10 = { ff15???????? 8d4b40 8bd0 8bf8 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8d4b40               | lea                 ecx, [ebx + 0x40]
            //   8bd0                 | mov                 edx, eax
            //   8bf8                 | mov                 edi, eax

        $sequence_11 = { ff15???????? 8bf8 85c0 7523 ff15???????? }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85c0                 | test                eax, eax
            //   7523                 | jne                 0x25
            //   ff15????????         |                     

        $sequence_12 = { e8???????? 85c0 742e 85db }
            // n = 4, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   742e                 | je                  0x30
            //   85db                 | test                ebx, ebx

        $sequence_13 = { e9???????? 803b25 0f85610c0000 33c9 }
            // n = 4, score = 200
            //   e9????????           |                     
            //   803b25               | cmp                 byte ptr [ebx], 0x25
            //   0f85610c0000         | jne                 0xc67
            //   33c9                 | xor                 ecx, ecx

        $sequence_14 = { a1???????? a3???????? a1???????? c705????????cf2f4000 }
            // n = 4, score = 100
            //   a1????????           |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   c705????????cf2f4000     |     

        $sequence_15 = { 03cf 03cb 81e1ff000000 8a99b0e74600 8898b0e74600 40 8891b0e74600 }
            // n = 7, score = 100
            //   03cf                 | add                 ecx, edi
            //   03cb                 | add                 ecx, ebx
            //   81e1ff000000         | and                 ecx, 0xff
            //   8a99b0e74600         | mov                 bl, byte ptr [ecx + 0x46e7b0]
            //   8898b0e74600         | mov                 byte ptr [eax + 0x46e7b0], bl
            //   40                   | inc                 eax
            //   8891b0e74600         | mov                 byte ptr [ecx + 0x46e7b0], dl

        $sequence_16 = { 43 83c408 83fb04 7cdc 8b5df8 8ad3 02d2 }
            // n = 7, score = 100
            //   43                   | inc                 ebx
            //   83c408               | add                 esp, 8
            //   83fb04               | cmp                 ebx, 4
            //   7cdc                 | jl                  0xffffffde
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   8ad3                 | mov                 dl, bl
            //   02d2                 | add                 dl, dl

        $sequence_17 = { 770e 6a0d 58 5d c3 8b04cd0cd04600 5d }
            // n = 7, score = 100
            //   770e                 | ja                  0x10
            //   6a0d                 | push                0xd
            //   58                   | pop                 eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b04cd0cd04600       | mov                 eax, dword ptr [ecx*8 + 0x46d00c]
            //   5d                   | pop                 ebp

        $sequence_18 = { 0fb6c0 eb12 8b45e0 8a80a4d54600 08443b1d }
            // n = 5, score = 100
            //   0fb6c0               | movzx               eax, al
            //   eb12                 | jmp                 0x14
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8a80a4d54600         | mov                 al, byte ptr [eax + 0x46d5a4]
            //   08443b1d             | or                  byte ptr [ebx + edi + 0x1d], al

        $sequence_19 = { 3c2f 7405 ff45f4 eb74 8b45f4 8a10 }
            // n = 6, score = 100
            //   3c2f                 | cmp                 al, 0x2f
            //   7405                 | je                  7
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   eb74                 | jmp                 0x76
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8a10                 | mov                 dl, byte ptr [eax]

        $sequence_20 = { 8b75fc 56 e8???????? 8bf8 8bc6 }
            // n = 5, score = 100
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   56                   | push                esi
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   8bc6                 | mov                 eax, esi

        $sequence_21 = { 0f849e000000 0fb6c8 51 e8???????? }
            // n = 4, score = 100
            //   0f849e000000         | je                  0xa4
            //   0fb6c8               | movzx               ecx, al
            //   51                   | push                ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 1642496
}