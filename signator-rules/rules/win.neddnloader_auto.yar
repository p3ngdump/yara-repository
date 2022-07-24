rule win_neddnloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.neddnloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neddnloader"
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
        $sequence_0 = { 8b7df8 8b7510 6a10 2bf7 59 8a1438 3217 }
            // n = 7, score = 200
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   6a10                 | push                0x10
            //   2bf7                 | sub                 esi, edi
            //   59                   | pop                 ecx
            //   8a1438               | mov                 dl, byte ptr [eax + edi]
            //   3217                 | xor                 dl, byte ptr [edi]

        $sequence_1 = { 33db 68fe030000 668985fcfbffff 8d85fefbffff 8bf1 }
            // n = 5, score = 200
            //   33db                 | xor                 ebx, ebx
            //   68fe030000           | push                0x3fe
            //   668985fcfbffff       | mov                 word ptr [ebp - 0x404], ax
            //   8d85fefbffff         | lea                 eax, [ebp - 0x402]
            //   8bf1                 | mov                 esi, ecx

        $sequence_2 = { eb05 8ac3 c0e004 53 ff75fc 8807 }
            // n = 6, score = 200
            //   eb05                 | jmp                 7
            //   8ac3                 | mov                 al, bl
            //   c0e004               | shl                 al, 4
            //   53                   | push                ebx
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   8807                 | mov                 byte ptr [edi], al

        $sequence_3 = { 8dbdfcefffff e8???????? 59 59 68000000a0 6aff 8bc7 }
            // n = 7, score = 200
            //   8dbdfcefffff         | lea                 edi, [ebp - 0x1004]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   68000000a0           | push                0xa0000000
            //   6aff                 | push                -1
            //   8bc7                 | mov                 eax, edi

        $sequence_4 = { e8???????? 83c40c 899df0fbffff 899de8fbffff 899decfbffff 3bf3 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   899df0fbffff         | mov                 dword ptr [ebp - 0x410], ebx
            //   899de8fbffff         | mov                 dword ptr [ebp - 0x418], ebx
            //   899decfbffff         | mov                 dword ptr [ebp - 0x414], ebx
            //   3bf3                 | cmp                 esi, ebx

        $sequence_5 = { 83c40c 2b5d10 8d041f 5f 5e 5b }
            // n = 6, score = 200
            //   83c40c               | add                 esp, 0xc
            //   2b5d10               | sub                 ebx, dword ptr [ebp + 0x10]
            //   8d041f               | lea                 eax, [edi + ebx]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_6 = { 40 e9???????? 8b500c 56 f7c200000002 7438 53 }
            // n = 7, score = 200
            //   40                   | inc                 eax
            //   e9????????           |                     
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]
            //   56                   | push                esi
            //   f7c200000002         | test                edx, 0x2000000
            //   7438                 | je                  0x3a
            //   53                   | push                ebx

        $sequence_7 = { 3bf9 732e 2bf7 8a043e }
            // n = 4, score = 200
            //   3bf9                 | cmp                 edi, ecx
            //   732e                 | jae                 0x30
            //   2bf7                 | sub                 esi, edi
            //   8a043e               | mov                 al, byte ptr [esi + edi]

        $sequence_8 = { a5 59 59 a5 75bf }
            // n = 5, score = 200
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   75bf                 | jne                 0xffffffc1

        $sequence_9 = { 59 85f6 744b 8d45f8 57 }
            // n = 5, score = 200
            //   59                   | pop                 ecx
            //   85f6                 | test                esi, esi
            //   744b                 | je                  0x4d
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   57                   | push                edi

    condition:
        7 of them and filesize < 237568
}