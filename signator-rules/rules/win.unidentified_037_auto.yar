rule win_unidentified_037_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.unidentified_037."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_037"
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
        $sequence_0 = { 5e 5d 5b c3 8b01 85c0 7406 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8

        $sequence_1 = { 7609 ff15???????? 8b4d0c 8b5604 85d2 741f 8a42ff }
            // n = 7, score = 100
            //   7609                 | jbe                 0xb
            //   ff15????????         |                     
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b5604               | mov                 edx, dword ptr [esi + 4]
            //   85d2                 | test                edx, edx
            //   741f                 | je                  0x21
            //   8a42ff               | mov                 al, byte ptr [edx - 1]

        $sequence_2 = { 897de4 897de8 897dec 8d55e0 897dfc 52 e8???????? }
            // n = 7, score = 100
            //   897de4               | mov                 dword ptr [ebp - 0x1c], edi
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   897dec               | mov                 dword ptr [ebp - 0x14], edi
            //   8d55e0               | lea                 edx, [ebp - 0x20]
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_3 = { 2bc7 3d00020000 7605 b800020000 8b7530 8b7d28 }
            // n = 6, score = 100
            //   2bc7                 | sub                 eax, edi
            //   3d00020000           | cmp                 eax, 0x200
            //   7605                 | jbe                 7
            //   b800020000           | mov                 eax, 0x200
            //   8b7530               | mov                 esi, dword ptr [ebp + 0x30]
            //   8b7d28               | mov                 edi, dword ptr [ebp + 0x28]

        $sequence_4 = { f7d1 49 8bf9 8d4c2434 57 897c2430 }
            // n = 6, score = 100
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   8bf9                 | mov                 edi, ecx
            //   8d4c2434             | lea                 ecx, [esp + 0x34]
            //   57                   | push                edi
            //   897c2430             | mov                 dword ptr [esp + 0x30], edi

        $sequence_5 = { 57 56 8d4d08 6aff 51 6a00 6a00 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   56                   | push                esi
            //   8d4d08               | lea                 ecx, [ebp + 8]
            //   6aff                 | push                -1
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_6 = { 8b5104 8b7c2418 33c0 03d0 895108 eb58 8b4508 }
            // n = 7, score = 100
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   33c0                 | xor                 eax, eax
            //   03d0                 | add                 edx, eax
            //   895108               | mov                 dword ptr [ecx + 8], edx
            //   eb58                 | jmp                 0x5a
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_7 = { 5e 5b c20800 8a4601 83e00f }
            // n = 5, score = 100
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c20800               | ret                 8
            //   8a4601               | mov                 al, byte ptr [esi + 1]
            //   83e00f               | and                 eax, 0xf

        $sequence_8 = { 8a8e809c0010 ff248d649c0010 8a4c2410 884201 80c904 eb3a }
            // n = 6, score = 100
            //   8a8e809c0010         | mov                 cl, byte ptr [esi + 0x10009c80]
            //   ff248d649c0010       | jmp                 dword ptr [ecx*4 + 0x10009c64]
            //   8a4c2410             | mov                 cl, byte ptr [esp + 0x10]
            //   884201               | mov                 byte ptr [edx + 1], al
            //   80c904               | or                  cl, 4
            //   eb3a                 | jmp                 0x3c

        $sequence_9 = { e8???????? 8d8c2450010000 c78424b8080000ffffffff e8???????? }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8d8c2450010000       | lea                 ecx, [esp + 0x150]
            //   c78424b8080000ffffffff     | mov    dword ptr [esp + 0x8b8], 0xffffffff
            //   e8????????           |                     

    condition:
        7 of them and filesize < 167936
}