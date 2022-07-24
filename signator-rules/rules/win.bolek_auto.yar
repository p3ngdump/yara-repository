rule win_bolek_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bolek."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bolek"
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
        $sequence_0 = { 8bf5 33d2 8b4c2414 8bc5 0facc80e c1e612 0bd0 }
            // n = 7, score = 600
            //   8bf5                 | mov                 esi, ebp
            //   33d2                 | xor                 edx, edx
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   8bc5                 | mov                 eax, ebp
            //   0facc80e             | shrd                eax, ecx, 0xe
            //   c1e612               | shl                 esi, 0x12
            //   0bd0                 | or                  edx, eax

        $sequence_1 = { ff7508 8975f4 e8???????? 85c0 7534 8b4df8 85c9 }
            // n = 7, score = 600
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7534                 | jne                 0x36
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   85c9                 | test                ecx, ecx

        $sequence_2 = { 83c410 85c0 7818 8d45f8 50 56 e8???????? }
            // n = 7, score = 600
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7818                 | js                  0x1a
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_3 = { 8d458c 50 ff75d8 8d8584fdffff 68???????? 6803010000 50 }
            // n = 7, score = 600
            //   8d458c               | lea                 eax, [ebp - 0x74]
            //   50                   | push                eax
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   8d8584fdffff         | lea                 eax, [ebp - 0x27c]
            //   68????????           |                     
            //   6803010000           | push                0x103
            //   50                   | push                eax

        $sequence_4 = { c3 33c0 c3 8b442404 85c0 7409 833802 }
            // n = 7, score = 600
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb
            //   833802               | cmp                 dword ptr [eax], 2

        $sequence_5 = { ff15???????? 8b44241c 03de 036c2420 83c40c 85f6 8b74242c }
            // n = 7, score = 600
            //   ff15????????         |                     
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   03de                 | add                 ebx, esi
            //   036c2420             | add                 ebp, dword ptr [esp + 0x20]
            //   83c40c               | add                 esp, 0xc
            //   85f6                 | test                esi, esi
            //   8b74242c             | mov                 esi, dword ptr [esp + 0x2c]

        $sequence_6 = { 8d45f8 50 8d45e4 50 8d45f0 50 e8???????? }
            // n = 7, score = 600
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_7 = { 8d45ec 56 50 6a02 ff15???????? 33c9 41 }
            // n = 7, score = 600
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   56                   | push                esi
            //   50                   | push                eax
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   33c9                 | xor                 ecx, ecx
            //   41                   | inc                 ecx

        $sequence_8 = { c1e60e 0bd0 c1e912 8b44242c 0bf1 33fe 33da }
            // n = 7, score = 600
            //   c1e60e               | shl                 esi, 0xe
            //   0bd0                 | or                  edx, eax
            //   c1e912               | shr                 ecx, 0x12
            //   8b44242c             | mov                 eax, dword ptr [esp + 0x2c]
            //   0bf1                 | or                  esi, ecx
            //   33fe                 | xor                 edi, esi
            //   33da                 | xor                 ebx, edx

        $sequence_9 = { ffb424a0080000 e8???????? 83c428 5f 5e 5d 5b }
            // n = 7, score = 600
            //   ffb424a0080000       | push                dword ptr [esp + 0x8a0]
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx

    condition:
        7 of them and filesize < 892928
}