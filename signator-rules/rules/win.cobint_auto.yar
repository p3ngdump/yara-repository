rule win_cobint_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.cobint."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cobint"
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
        $sequence_0 = { 8b4d10 49 51 8d4e01 56 51 }
            // n = 6, score = 400
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   49                   | dec                 ecx
            //   51                   | push                ecx
            //   8d4e01               | lea                 ecx, [esi + 1]
            //   56                   | push                esi
            //   51                   | push                ecx

        $sequence_1 = { 3bc2 8bd1 0f82bf000000 8d4608 03c1 8945fc 85f6 }
            // n = 7, score = 400
            //   3bc2                 | cmp                 eax, edx
            //   8bd1                 | mov                 edx, ecx
            //   0f82bf000000         | jb                  0xc5
            //   8d4608               | lea                 eax, [esi + 8]
            //   03c1                 | add                 eax, ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   85f6                 | test                esi, esi

        $sequence_2 = { 33d2 53 8b5d08 8bc1 3918 0f84a0000000 }
            // n = 6, score = 400
            //   33d2                 | xor                 edx, edx
            //   53                   | push                ebx
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8bc1                 | mov                 eax, ecx
            //   3918                 | cmp                 dword ptr [eax], ebx
            //   0f84a0000000         | je                  0xa6

        $sequence_3 = { 83e801 752a ff7518 ff7510 }
            // n = 4, score = 400
            //   83e801               | sub                 eax, 1
            //   752a                 | jne                 0x2c
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   ff7510               | push                dword ptr [ebp + 0x10]

        $sequence_4 = { 897cc808 8b15???????? a1???????? 03d2 8b4d14 }
            // n = 5, score = 400
            //   897cc808             | mov                 dword ptr [eax + ecx*8 + 8], edi
            //   8b15????????         |                     
            //   a1????????           |                     
            //   03d2                 | add                 edx, edx
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]

        $sequence_5 = { 8d460c 50 e8???????? 8b4d08 8bf8 }
            // n = 5, score = 400
            //   8d460c               | lea                 eax, [esi + 0xc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8bf8                 | mov                 edi, eax

        $sequence_6 = { e8???????? 83c40c 84db 7405 8d4601 ebd3 }
            // n = 6, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   84db                 | test                bl, bl
            //   7405                 | je                  7
            //   8d4601               | lea                 eax, [esi + 1]
            //   ebd3                 | jmp                 0xffffffd5

        $sequence_7 = { 7ce3 5e 5d c3 56 57 bf???????? }
            // n = 7, score = 400
            //   7ce3                 | jl                  0xffffffe5
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   56                   | push                esi
            //   57                   | push                edi
            //   bf????????           |                     

        $sequence_8 = { c3 31b7807c30ae 807c909090 90 bdfd807c90 90 }
            // n = 6, score = 200
            //   c3                   | ret                 
            //   31b7807c30ae         | xor                 dword ptr [edi - 0x51cf8380], esi
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90
            //   90                   | nop                 
            //   bdfd807c90           | mov                 ebp, 0x907c80fd
            //   90                   | nop                 

        $sequence_9 = { 837d1000 740d 8b5508 0355f0 8a45ec 8802 }
            // n = 6, score = 200
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   740d                 | je                  0xf
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0355f0               | add                 edx, dword ptr [ebp - 0x10]
            //   8a45ec               | mov                 al, byte ptr [ebp - 0x14]
            //   8802                 | mov                 byte ptr [edx], al

        $sequence_10 = { 895df4 8b400c 8b5014 33c0 eb38 8b7228 8bf8 }
            // n = 7, score = 200
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b5014               | mov                 edx, dword ptr [eax + 0x14]
            //   33c0                 | xor                 eax, eax
            //   eb38                 | jmp                 0x3a
            //   8b7228               | mov                 esi, dword ptr [edx + 0x28]
            //   8bf8                 | mov                 edi, eax

        $sequence_11 = { 8bc6 4e 8975f4 85c0 7505 b301 885dff }
            // n = 7, score = 200
            //   8bc6                 | mov                 eax, esi
            //   4e                   | dec                 esi
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   b301                 | mov                 bl, 1
            //   885dff               | mov                 byte ptr [ebp - 1], bl

        $sequence_12 = { 66391e 75e3 8b5df4 81ffea968891 }
            // n = 4, score = 200
            //   66391e               | cmp                 word ptr [esi], bx
            //   75e3                 | jne                 0xffffffe5
            //   8b5df4               | mov                 ebx, dword ptr [ebp - 0xc]
            //   81ffea968891         | cmp                 edi, 0x918896ea

        $sequence_13 = { 90 bffc807c28 1a807c170e81 7cd7 }
            // n = 4, score = 200
            //   90                   | nop                 
            //   bffc807c28           | mov                 edi, 0x287c80fc
            //   1a807c170e81         | sbb                 al, byte ptr [eax - 0x7ef1e884]
            //   7cd7                 | jl                  0xffffffd9

        $sequence_14 = { c1c108 47 8d1c08 8a07 84c0 }
            // n = 5, score = 200
            //   c1c108               | rol                 ecx, 8
            //   47                   | inc                 edi
            //   8d1c08               | lea                 ebx, [eax + ecx]
            //   8a07                 | mov                 al, byte ptr [edi]
            //   84c0                 | test                al, al

        $sequence_15 = { e8???????? 33c9 51 51 51 51 8d8d24feffff }
            // n = 7, score = 200
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   8d8d24feffff         | lea                 ecx, [ebp - 0x1dc]

        $sequence_16 = { 90 90 90 e10b 96 7c90 }
            // n = 6, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   e10b                 | loope               0xd
            //   96                   | xchg                eax, esi
            //   7c90                 | jl                  0xffffff92

        $sequence_17 = { 90 90 90 90 90 90 749b }
            // n = 7, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   749b                 | je                  0xffffff9d

        $sequence_18 = { 7412 8b45ec 42 3b5318 72c4 }
            // n = 5, score = 200
            //   7412                 | je                  0x14
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   42                   | inc                 edx
            //   3b5318               | cmp                 edx, dword ptr [ebx + 0x18]
            //   72c4                 | jb                  0xffffffc6

        $sequence_19 = { 1a807c170e81 7cd7 9b 807c909090 90 90 90 }
            // n = 7, score = 200
            //   1a807c170e81         | sbb                 al, byte ptr [eax - 0x7ef1e884]
            //   7cd7                 | jl                  0xffffffd9
            //   9b                   | wait                
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 

        $sequence_20 = { eb38 8b7228 8bf8 663906 742c 33db 8a06 }
            // n = 7, score = 200
            //   eb38                 | jmp                 0x3a
            //   8b7228               | mov                 esi, dword ptr [edx + 0x28]
            //   8bf8                 | mov                 edi, eax
            //   663906               | cmp                 word ptr [esi], ax
            //   742c                 | je                  0x2e
            //   33db                 | xor                 ebx, ebx
            //   8a06                 | mov                 al, byte ptr [esi]

        $sequence_21 = { 8d8d24feffff 51 ffd0 8945d4 85c0 0f8444020000 ba5953df81 }
            // n = 7, score = 200
            //   8d8d24feffff         | lea                 ecx, [ebp - 0x1dc]
            //   51                   | push                ecx
            //   ffd0                 | call                eax
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   85c0                 | test                eax, eax
            //   0f8444020000         | je                  0x24a
            //   ba5953df81           | mov                 edx, 0x81df5359

        $sequence_22 = { 0355f0 8a45ec 8802 eb0b 8b4d08 034df0 }
            // n = 6, score = 200
            //   0355f0               | add                 edx, dword ptr [ebp - 0x10]
            //   8a45ec               | mov                 al, byte ptr [ebp - 0x14]
            //   8802                 | mov                 byte ptr [edx], al
            //   eb0b                 | jmp                 0xd
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   034df0               | add                 ecx, dword ptr [ebp - 0x10]

        $sequence_23 = { 90 749b 807ce19a80 7c90 90 90 90 }
            // n = 7, score = 200
            //   90                   | nop                 
            //   749b                 | je                  0xffffff9d
            //   807ce19a80           | cmp                 byte ptr [ecx - 0x66], 0x80
            //   7c90                 | jl                  0xffffff92
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 

    condition:
        7 of them and filesize < 65536
}