rule win_expiro_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.expiro."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.expiro"
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
        $sequence_0 = { 8d742478 e8???????? 8d8424c0000000 8d5002 8d9b00000000 668b08 83c002 }
            // n = 7, score = 100
            //   8d742478             | lea                 esi, [esp + 0x78]
            //   e8????????           |                     
            //   8d8424c0000000       | lea                 eax, [esp + 0xc0]
            //   8d5002               | lea                 edx, [eax + 2]
            //   8d9b00000000         | lea                 ebx, [ebx]
            //   668b08               | mov                 cx, word ptr [eax]
            //   83c002               | add                 eax, 2

        $sequence_1 = { 199973aec738 f8 7373 27 0a3f 7369 735a }
            // n = 7, score = 100
            //   199973aec738         | sbb                 dword ptr [ecx + 0x38c7ae73], ebx
            //   f8                   | clc                 
            //   7373                 | jae                 0x75
            //   27                   | daa                 
            //   0a3f                 | or                  bh, byte ptr [edi]
            //   7369                 | jae                 0x6b
            //   735a                 | jae                 0x5c

        $sequence_2 = { 8b54241c bd08000000 396c2430 7304 8d54241c 8b4c2438 396c244c }
            // n = 7, score = 100
            //   8b54241c             | mov                 edx, dword ptr [esp + 0x1c]
            //   bd08000000           | mov                 ebp, 8
            //   396c2430             | cmp                 dword ptr [esp + 0x30], ebp
            //   7304                 | jae                 6
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   8b4c2438             | mov                 ecx, dword ptr [esp + 0x38]
            //   396c244c             | cmp                 dword ptr [esp + 0x4c], ebp

        $sequence_3 = { 8d742428 e8???????? b801000000 e9???????? 8b4c2418 83c104 51 }
            // n = 7, score = 100
            //   8d742428             | lea                 esi, [esp + 0x28]
            //   e8????????           |                     
            //   b801000000           | mov                 eax, 1
            //   e9????????           |                     
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   83c104               | add                 ecx, 4
            //   51                   | push                ecx

        $sequence_4 = { e8???????? c744245000000000 8b44240c bb08000000 395c2420 7304 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   c744245000000000     | mov                 dword ptr [esp + 0x50], 0
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   bb08000000           | mov                 ebx, 8
            //   395c2420             | cmp                 dword ptr [esp + 0x20], ebx
            //   7304                 | jae                 6

        $sequence_5 = { 707e ab 93 63635a }
            // n = 4, score = 100
            //   707e                 | jo                  0x80
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   93                   | xchg                eax, ebx
            //   63635a               | arpl                word ptr [ebx + 0x5a], sp

        $sequence_6 = { 8d7c246c c684241c0900001d e8???????? 83c404 84c0 0f94c3 83bc24b400000008 }
            // n = 7, score = 100
            //   8d7c246c             | lea                 edi, [esp + 0x6c]
            //   c684241c0900001d     | mov                 byte ptr [esp + 0x91c], 0x1d
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   84c0                 | test                al, al
            //   0f94c3               | sete                bl
            //   83bc24b400000008     | cmp                 dword ptr [esp + 0xb4], 8

        $sequence_7 = { a3???????? a2???????? 395d08 0f8e45060000 8b450c }
            // n = 5, score = 100
            //   a3????????           |                     
            //   a2????????           |                     
            //   395d08               | cmp                 dword ptr [ebp + 8], ebx
            //   0f8e45060000         | jle                 0x64b
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_8 = { 7204 8b06 eb02 8bc6 33d2 66891478 8b442428 }
            // n = 7, score = 100
            //   7204                 | jb                  6
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   eb02                 | jmp                 4
            //   8bc6                 | mov                 eax, esi
            //   33d2                 | xor                 edx, edx
            //   66891478             | mov                 word ptr [eax + edi*2], dx
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]

        $sequence_9 = { 8b4df8 99 f7f9 29c7 8b55b8 8a4dff }
            // n = 6, score = 100
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   99                   | cdq                 
            //   f7f9                 | idiv                ecx
            //   29c7                 | sub                 edi, eax
            //   8b55b8               | mov                 edx, dword ptr [ebp - 0x48]
            //   8a4dff               | mov                 cl, byte ptr [ebp - 1]

    condition:
        7 of them and filesize < 3776512
}