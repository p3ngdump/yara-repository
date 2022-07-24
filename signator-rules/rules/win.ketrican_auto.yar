rule win_ketrican_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ketrican."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ketrican"
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
        $sequence_0 = { 8965f0 33db 895dfc 33c0 }
            // n = 4, score = 700
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp
            //   33db                 | xor                 ebx, ebx
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 5e c3 55 8bec 837d0800 7d0a }
            // n = 6, score = 600
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7d0a                 | jge                 0xc

        $sequence_2 = { c3 55 8bec 8b4508 85c0 742c 83f80c }
            // n = 7, score = 600
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   85c0                 | test                eax, eax
            //   742c                 | je                  0x2e
            //   83f80c               | cmp                 eax, 0xc

        $sequence_3 = { 8906 c3 56 8bf1 57 8bf8 8b06 }
            // n = 7, score = 600
            //   8906                 | mov                 dword ptr [esi], eax
            //   c3                   | ret                 
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_4 = { 8bc1 8945f0 834dfcff e8???????? }
            // n = 4, score = 600
            //   8bc1                 | mov                 eax, ecx
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   e8????????           |                     

        $sequence_5 = { 8901 5b 5d c20800 680e000780 }
            // n = 5, score = 600
            //   8901                 | mov                 dword ptr [ecx], eax
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   680e000780           | push                0x8007000e

        $sequence_6 = { e8???????? cc 8b06 83e810 }
            // n = 4, score = 600
            //   e8????????           |                     
            //   cc                   | int3                
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   83e810               | sub                 eax, 0x10

        $sequence_7 = { 8bd1 e8???????? 5f 5e c3 55 }
            // n = 6, score = 600
            //   8bd1                 | mov                 edx, ecx
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_8 = { 83c005 8d4dd8 51 50 e8???????? }
            // n = 5, score = 500
            //   83c005               | add                 eax, 5
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { 59 e8???????? 8bf0 e8???????? 0fafc6 }
            // n = 5, score = 500
            //   59                   | pop                 ecx
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   0fafc6               | imul                eax, esi

        $sequence_10 = { 83a5d8fbffff00 eb0d 8b85d8fbffff 40 8985d8fbffff }
            // n = 5, score = 500
            //   83a5d8fbffff00       | and                 dword ptr [ebp - 0x428], 0
            //   eb0d                 | jmp                 0xf
            //   8b85d8fbffff         | mov                 eax, dword ptr [ebp - 0x428]
            //   40                   | inc                 eax
            //   8985d8fbffff         | mov                 dword ptr [ebp - 0x428], eax

        $sequence_11 = { 894df8 894508 8b45fc 8b38 8bc7 c1e808 83e00f }
            // n = 7, score = 500
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   8bc7                 | mov                 eax, edi
            //   c1e808               | shr                 eax, 8
            //   83e00f               | and                 eax, 0xf

        $sequence_12 = { ff7508 53 53 ffd6 50 ff750c 57 }
            // n = 7, score = 500
            //   ff7508               | push                dword ptr [ebp + 8]
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   50                   | push                eax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   57                   | push                edi

        $sequence_13 = { 68e8030000 53 6a02 53 6aff ff15???????? 8bf0 }
            // n = 7, score = 500
            //   68e8030000           | push                0x3e8
            //   53                   | push                ebx
            //   6a02                 | push                2
            //   53                   | push                ebx
            //   6aff                 | push                -1
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_14 = { 8d7ded aa a1???????? 40 99 6a03 }
            // n = 6, score = 500
            //   8d7ded               | lea                 edi, [ebp - 0x13]
            //   aa                   | stosb               byte ptr es:[edi], al
            //   a1????????           |                     
            //   40                   | inc                 eax
            //   99                   | cdq                 
            //   6a03                 | push                3

        $sequence_15 = { 0f840c000000 8365d4fe 8d4da4 e9???????? c3 8d4dbc e9???????? }
            // n = 7, score = 100
            //   0f840c000000         | je                  0x12
            //   8365d4fe             | and                 dword ptr [ebp - 0x2c], 0xfffffffe
            //   8d4da4               | lea                 ecx, [ebp - 0x5c]
            //   e9????????           |                     
            //   c3                   | ret                 
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]
            //   e9????????           |                     

        $sequence_16 = { 8d4db8 e9???????? 8d4ddc e9???????? 8b45d4 }
            // n = 5, score = 100
            //   8d4db8               | lea                 ecx, [ebp - 0x48]
            //   e9????????           |                     
            //   8d4ddc               | lea                 ecx, [ebp - 0x24]
            //   e9????????           |                     
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]

        $sequence_17 = { b8???????? e9???????? 8b4508 e9???????? 8b45ec 83e001 0f840c000000 }
            // n = 7, score = 100
            //   b8????????           |                     
            //   e9????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   e9????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   83e001               | and                 eax, 1
            //   0f840c000000         | je                  0x12

        $sequence_18 = { ff15???????? 68???????? c705????????98824100 a3???????? c605????????00 e8???????? }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   68????????           |                     
            //   c705????????98824100     |     
            //   a3????????           |                     
            //   c605????????00       |                     
            //   e8????????           |                     

        $sequence_19 = { 8d420c 8b4ae8 33c8 e8???????? 8b8a4c010000 33c8 e8???????? }
            // n = 7, score = 100
            //   8d420c               | lea                 eax, [edx + 0xc]
            //   8b4ae8               | mov                 ecx, dword ptr [edx - 0x18]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     
            //   8b8a4c010000         | mov                 ecx, dword ptr [edx + 0x14c]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     

        $sequence_20 = { 33c8 e8???????? 8b8ae8060000 33c8 e8???????? }
            // n = 5, score = 100
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     
            //   8b8ae8060000         | mov                 ecx, dword ptr [edx + 0x6e8]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     

        $sequence_21 = { e8???????? 8b8ae8080000 33c8 e8???????? b8???????? e9???????? 8b542408 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b8ae8080000         | mov                 ecx, dword ptr [edx + 0x8e8]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     
            //   b8????????           |                     
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]

        $sequence_22 = { b8???????? e9???????? 8d4dc0 e9???????? 8b542408 8d420c 8b8a54ffffff }
            // n = 7, score = 100
            //   b8????????           |                     
            //   e9????????           |                     
            //   8d4dc0               | lea                 ecx, [ebp - 0x40]
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8d420c               | lea                 eax, [edx + 0xc]
            //   8b8a54ffffff         | mov                 ecx, dword ptr [edx - 0xac]

    condition:
        7 of them and filesize < 1449984
}