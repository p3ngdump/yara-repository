rule win_strongpity_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.strongpity."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.strongpity"
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
        $sequence_0 = { 83e901 75f8 ff75ec 8b4608 }
            // n = 4, score = 700
            //   83e901               | sub                 ecx, 1
            //   75f8                 | jne                 0xfffffffa
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   8b4608               | mov                 eax, dword ptr [esi + 8]

        $sequence_1 = { 75f8 57 e8???????? 59 }
            // n = 4, score = 700
            //   75f8                 | jne                 0xfffffffa
            //   57                   | push                edi
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_2 = { 8bce 8818 40 83e901 75f8 8bce }
            // n = 6, score = 700
            //   8bce                 | mov                 ecx, esi
            //   8818                 | mov                 byte ptr [eax], bl
            //   40                   | inc                 eax
            //   83e901               | sub                 ecx, 1
            //   75f8                 | jne                 0xfffffffa
            //   8bce                 | mov                 ecx, esi

        $sequence_3 = { 51 e8???????? 59 8bc8 890e 85c9 }
            // n = 6, score = 700
            //   51                   | push                ecx
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bc8                 | mov                 ecx, eax
            //   890e                 | mov                 dword ptr [esi], ecx
            //   85c9                 | test                ecx, ecx

        $sequence_4 = { 8b45d4 8d044502000000 85c0 7408 8819 }
            // n = 5, score = 700
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   8d044502000000       | lea                 eax, [eax*2 + 2]
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   8819                 | mov                 byte ptr [ecx], bl

        $sequence_5 = { 59 e9???????? 8d0c7d02000000 85c9 7408 }
            // n = 5, score = 700
            //   59                   | pop                 ecx
            //   e9????????           |                     
            //   8d0c7d02000000       | lea                 ecx, [edi*2 + 2]
            //   85c9                 | test                ecx, ecx
            //   7408                 | je                  0xa

        $sequence_6 = { 7416 6a04 8d45f8 c745f800330000 50 }
            // n = 5, score = 700
            //   7416                 | je                  0x18
            //   6a04                 | push                4
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   c745f800330000       | mov                 dword ptr [ebp - 8], 0x3300
            //   50                   | push                eax

        $sequence_7 = { 75f4 8d45c0 2bca 50 33c0 }
            // n = 5, score = 700
            //   75f4                 | jne                 0xfffffff6
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   2bca                 | sub                 ecx, edx
            //   50                   | push                eax
            //   33c0                 | xor                 eax, eax

        $sequence_8 = { 5f 5e 89818c040000 8bc5 5d 5b 83c40c }
            // n = 7, score = 300
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   89818c040000         | mov                 dword ptr [ecx + 0x48c], eax
            //   8bc5                 | mov                 eax, ebp
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   83c40c               | add                 esp, 0xc

        $sequence_9 = { 012e 885c240a e9???????? 84db 0f8434020000 }
            // n = 5, score = 300
            //   012e                 | add                 dword ptr [esi], ebp
            //   885c240a             | mov                 byte ptr [esp + 0xa], bl
            //   e9????????           |                     
            //   84db                 | test                bl, bl
            //   0f8434020000         | je                  0x23a

        $sequence_10 = { 5f 5e 89824c040000 8bc5 }
            // n = 4, score = 300
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   89824c040000         | mov                 dword ptr [edx + 0x44c], eax
            //   8bc5                 | mov                 eax, ebp

        $sequence_11 = { 57 8b7c240c 8db710050000 7552 8b462c 85c0 744b }
            // n = 7, score = 300
            //   57                   | push                edi
            //   8b7c240c             | mov                 edi, dword ptr [esp + 0xc]
            //   8db710050000         | lea                 esi, [edi + 0x510]
            //   7552                 | jne                 0x54
            //   8b462c               | mov                 eax, dword ptr [esi + 0x2c]
            //   85c0                 | test                eax, eax
            //   744b                 | je                  0x4d

        $sequence_12 = { 5f 5e 8981a4040000 8bc5 }
            // n = 4, score = 300
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8981a4040000         | mov                 dword ptr [ecx + 0x4a4], eax
            //   8bc5                 | mov                 eax, ebp

        $sequence_13 = { 5f 5e 89904c010000 8bc5 }
            // n = 4, score = 300
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   89904c010000         | mov                 dword ptr [eax + 0x14c], edx
            //   8bc5                 | mov                 eax, ebp

        $sequence_14 = { 012e 885c240a ebc3 80fb5d 7520 837c240c00 0f85fe020000 }
            // n = 7, score = 300
            //   012e                 | add                 dword ptr [esi], ebp
            //   885c240a             | mov                 byte ptr [esp + 0xa], bl
            //   ebc3                 | jmp                 0xffffffc5
            //   80fb5d               | cmp                 bl, 0x5d
            //   7520                 | jne                 0x22
            //   837c240c00           | cmp                 dword ptr [esp + 0xc], 0
            //   0f85fe020000         | jne                 0x304

        $sequence_15 = { 0107 83be8800000002 8b07 0f85ad000000 83f814 }
            // n = 5, score = 300
            //   0107                 | add                 dword ptr [edi], eax
            //   83be8800000002       | cmp                 dword ptr [esi + 0x88], 2
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   0f85ad000000         | jne                 0xb3
            //   83f814               | cmp                 eax, 0x14

    condition:
        7 of them and filesize < 999424
}