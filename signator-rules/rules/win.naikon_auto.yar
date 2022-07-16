rule win_naikon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.naikon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.naikon"
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
        $sequence_0 = { 7544 56 8d85a0faffff 6a00 50 e8???????? 8d85d4fcffff }
            // n = 7, score = 200
            //   7544                 | jne                 0x46
            //   56                   | push                esi
            //   8d85a0faffff         | lea                 eax, [ebp - 0x560]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d85d4fcffff         | lea                 eax, [ebp - 0x32c]

        $sequence_1 = { ff75f4 ffd6 ff75cc ffd6 8b45fc 5f 5e }
            // n = 7, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ffd6                 | call                esi
            //   ff75cc               | push                dword ptr [ebp - 0x34]
            //   ffd6                 | call                esi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_2 = { e8???????? 83c428 03fe 8d85a8fcffff 50 ff7508 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28
            //   03fe                 | add                 edi, esi
            //   8d85a8fcffff         | lea                 eax, [ebp - 0x358]
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_3 = { 8b466c 51 834e5418 ff750c 57 57 }
            // n = 6, score = 200
            //   8b466c               | mov                 eax, dword ptr [esi + 0x6c]
            //   51                   | push                ecx
            //   834e5418             | or                  dword ptr [esi + 0x54], 0x18
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   57                   | push                edi
            //   57                   | push                edi

        $sequence_4 = { 57 56 56 7504 6a02 eb02 }
            // n = 6, score = 200
            //   57                   | push                edi
            //   56                   | push                esi
            //   56                   | push                esi
            //   7504                 | jne                 6
            //   6a02                 | push                2
            //   eb02                 | jmp                 4

        $sequence_5 = { 59 0f8580000000 8d85dcfdffff 56 50 ff35???????? }
            // n = 6, score = 200
            //   59                   | pop                 ecx
            //   0f8580000000         | jne                 0x86
            //   8d85dcfdffff         | lea                 eax, [ebp - 0x224]
            //   56                   | push                esi
            //   50                   | push                eax
            //   ff35????????         |                     

        $sequence_6 = { 6683395c 7409 48 49 49 85c0 }
            // n = 6, score = 200
            //   6683395c             | cmp                 word ptr [ecx], 0x5c
            //   7409                 | je                  0xb
            //   48                   | dec                 eax
            //   49                   | dec                 ecx
            //   49                   | dec                 ecx
            //   85c0                 | test                eax, eax

        $sequence_7 = { 80a0e02f011000 40 3bc6 72be 5e }
            // n = 5, score = 200
            //   80a0e02f011000       | and                 byte ptr [eax + 0x10012fe0], 0
            //   40                   | inc                 eax
            //   3bc6                 | cmp                 eax, esi
            //   72be                 | jb                  0xffffffc0
            //   5e                   | pop                 esi

        $sequence_8 = { ff15???????? 85c0 0f849c000000 8b4508 03c7 894508 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f849c000000         | je                  0xa2
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   03c7                 | add                 eax, edi
            //   894508               | mov                 dword ptr [ebp + 8], eax

        $sequence_9 = { ff15???????? 8bd8 8d8598fbffff 50 ffb5d0fdffff e8???????? 59 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   8d8598fbffff         | lea                 eax, [ebp - 0x468]
            //   50                   | push                eax
            //   ffb5d0fdffff         | push                dword ptr [ebp - 0x230]
            //   e8????????           |                     
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 188416
}